import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/cupertino.dart';

class PrintReceiptService {
  Future<void> receipt(
      NetworkPrinter pw, TransactionItem? transactionItem) async {
    final dateTimeSplit = transactionItem?.dateTime.toString().split('_');
    final receiptId =
        '00${transactionItem?.dateTime.toString().replaceAll('-', '').replaceAll('_', '').replaceAll(':', '')}';
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
    for (var index = 0;
        index < transactionItem!.calculatedItem.length;
        index++) {
      final calculatedItem = transactionItem.calculatedItem[index];
      pw.text(
          '${calculatedItem.transaction.toUpperCase()} ${calculatedItem.currency}');
      for (var calculateItem = 0;
          calculateItem < calculatedItem.calculatedItem.length;
          calculateItem++) {
        pw.row([
          PosColumn(
            text: calculatedItem.priceRange[calculateItem].getRange(),
            width: 6,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text:
                '${calculatedItem.calculatedItem[calculateItem].amount} x ${calculatedItem.priceRange[calculateItem].price} = ${calculatedItem.calculatedItem[calculateItem].price}',
            width: 6,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      pw.hr(ch: '-', linesAfter: 0);
      pw.text(
          'Amount Exchange ${calculatedItem.amountExchange} ${calculatedItem.transaction == Transaction.buy.name ? calculatedItem.currency : 'THB'}',
          styles: const PosStyles(align: PosAlign.right));
      pw.text(
          'Total ${calculatedItem.totalPrice} ${calculatedItem.transaction != Transaction.buy.name ? calculatedItem.currency : 'THB'}',
          styles: const PosStyles(align: PosAlign.right));
      pw.hr(ch: '=', linesAfter: 1);
    }
    pw.text('Thank you',
        styles: const PosStyles(bold: true, align: PosAlign.center));
    pw.feed(3);
    pw.cut();
  }

  Future<bool> printThermal(TransactionItem? transactionItem) async {
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    try {
      final PosPrintResult res =
          await printer.connect('192.168.1.149', port: 9100);
      if (res == PosPrintResult.success) {
        await receipt(printer, transactionItem);
        printer.disconnect();
        return true;
      }
      throw PrintingException('Print Unsuccessful');
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
