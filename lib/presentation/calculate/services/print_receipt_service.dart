import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/models/exception.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/models/transaction_item.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

class PrintReceiptService {
  late NetworkPrinter pw;
  String? id;
  TransactionItem? transactionItem;

  Future<bool> initPrint(TransactionItem? transactionItem, String? id) async {
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    pw = NetworkPrinter(paper, profile);
    this.transactionItem = transactionItem;
    this.id = id;
    try {
      final PosPrintResult res = await pw.connect('192.168.1.149', port: 9100);
      if (res == PosPrintResult.success) {
        await _receipt();
        pw.disconnect();
        this.transactionItem = null;
        this.id = null;
        return true;
      }
      throw PrintingException('Print Unsuccessful');
    } catch (e) {
      if (e is Error) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(
            FlutterErrorDetails(
                exception: PrintingException('Error Printing'),
                stack: e.stackTrace));
      }
      FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(exception: PrintingException(e.toString())));
      throw PrintingException(e.toString());
    }
  }

  Future<void> _receipt() async {
    if (transactionItem == null) {
      throw PrintingException('Transaction data missing');
    }
    final dateTimeSplit = transactionItem!.dateTime.toString().split('_');
    final receiptId =
        '00${transactionItem!.dateTime.toString().replaceAll('-', '').replaceAll('_', '').replaceAll(':', '')}';
    const headLine = PosStyles(
        fontType: PosFontType.fontA,
        align: PosAlign.center,
        width: PosTextSize.size2,
        height: PosTextSize.size2,
        bold: true);
    pw.text('Receipt', styles: headLine);
    pw.text('Sapphire Exchange', styles: headLine, linesAfter: 1);
    pw.text('Address: 465 Yaowarat Rd,',
        styles: const PosStyles(align: PosAlign.center));
    pw.text('Samphanthawong, Bangkok 10100',
        styles: const PosStyles(align: PosAlign.center), linesAfter: 1);
    pw.feed(1);

    pw.text('DateTime: ${dateTimeSplit[0]} ${dateTimeSplit[1]}');
    pw.text('NO: $receiptId', linesAfter: 1);

    pw.text('Name: ${transactionItem!.clientInfo?.name ?? ''}');
    pw.text('Address: ${transactionItem!.clientInfo?.address ?? ''}');
    pw.text('ID/Passport: $id', linesAfter: 1);

    pw.hr(ch: '=', linesAfter: 0);

    getTransactionList();

    if (transactionItem!.totalBuyPrice != null &&
        transactionItem!.totalBuyPrice! > 0.0) {
      pw.text(
          'Total BUY ${transactionItem!.getTotalBuyPrice()} ${AppStrings.thb}',
          styles: const PosStyles(align: PosAlign.left));
    }
    if (transactionItem!.totalSellPrice != null &&
        transactionItem!.totalSellPrice! > 0.0) {
      pw.text(
          'Total SELL ${transactionItem!.getTotalSellPrice()} ${AppStrings.thb}',
          styles: const PosStyles(align: PosAlign.left));
    }
    pw.hr(ch: '=', linesAfter: 1);
    pw.text('Please verify the transaction',
        styles: const PosStyles(
            bold: true, align: PosAlign.center, height: PosTextSize.size1));
    pw.text('and amount received',
        styles: const PosStyles(
            bold: true, align: PosAlign.center, height: PosTextSize.size1));
    pw.feed(3);
    pw.cut();
  }

  void getTransactionList() {
    List<List<PosColumn>> buyList = [];
    List<List<PosColumn>> sellList = [];
    for (var item = 0; item < transactionItem!.calculatedItem.length; item++) {
      final calculatedItem = transactionItem!.calculatedItem[item];
      for (var calculateItem = 0;
          calculateItem < (calculatedItem.calculatedItem.length);
          calculateItem++) {
        final getPrice =
            (calculatedItem.calculatedItem[calculateItem].priceRange ??
                        calculatedItem.priceRange?[calculateItem])
                    ?.getPrice() ??
                '';
        if (calculatedItem.transaction == Transaction.buy) {
          buyList.add([
            PosColumn(
              text: calculatedItem.currency,
              width: 3,
              styles: const PosStyles(align: PosAlign.left),
            ),
            PosColumn(
              text: getPrice,
              width: 3,
              styles: const PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text:
                  '$getPrice=${calculatedItem.calculatedItem[calculateItem].getPrice()}',
              width: 6,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]);
        } else {
          sellList.add([
            PosColumn(
              text: calculatedItem.currency,
              width: 3,
              styles: const PosStyles(align: PosAlign.left),
            ),
            PosColumn(
              text: getPrice,
              width: 3,
              styles: const PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text:
                  '$getPrice=${calculatedItem.calculatedItem[calculateItem].getPrice()}',
              width: 6,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]);
        }
      }
    }
    if (buyList.isNotEmpty) {
      pw.text('BUY');
      for (var i in buyList) {
        pw.row(i);
      }
      pw.hr(ch: '-', linesAfter: 0);
    }
    if (sellList.isNotEmpty) {
      pw.text('SELL');
      for (var i in sellList) {
        pw.row(i);
      }
      pw.hr(ch: '-', linesAfter: 0);
    }
    pw.hr(ch: '-', linesAfter: 0);
  }
}
