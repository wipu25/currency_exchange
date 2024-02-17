import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/cupertino.dart';

class PrintReceiptService {
  late NetworkPrinter pw;
  TransactionItem? transactionItem;

  Future<bool> initPrint(TransactionItem? transactionItem) async {
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    pw = NetworkPrinter(paper, profile);
    this.transactionItem = transactionItem;
    try {
      final PosPrintResult res = await pw.connect('192.168.1.149', port: 9100);
      if (res == PosPrintResult.success) {
        await _receipt();
        pw.disconnect();
        return true;
      }
      throw PrintingException('Print Unsuccessful');
    } catch (e) {
      debugPrint(e.toString());
      return false;
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

    pw.text('DateTime: ${dateTimeSplit![0]} ${dateTimeSplit[1]}');
    pw.text('NO: $receiptId', linesAfter: 1);

    pw.hr(ch: '=', linesAfter: 0);

    getTransactionList(Transaction.buy);
    getTransactionList(Transaction.sell);

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
    pw.text('Thank you',
        styles: const PosStyles(bold: true, align: PosAlign.center));
    pw.feed(3);
    pw.cut();
  }

  void getTransactionList(Transaction transaction) {
    transactionItem!.calculatedItem
        .where((element) => element.transaction == transaction.name)
        .map((calculatedItem) {
      for (var calculateItem = 0;
          calculateItem < calculatedItem.calculatedItem.length;
          calculateItem++) {
        pw.row([
          PosColumn(
            text:
                '${calculatedItem.transaction.toUpperCase()} ${calculatedItem.currency}',
            width: 4,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: calculatedItem.priceRange[calculateItem].getRange(),
            width: 4,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text:
                '${calculatedItem.calculatedItem[calculateItem].getAmount()}x${calculatedItem.priceRange[calculateItem].getPrice()}=${calculatedItem.calculatedItem[calculateItem].getPrice()}',
            width: 4,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
      }
    });
    pw.hr(ch: '-', linesAfter: 0);
  }
}
