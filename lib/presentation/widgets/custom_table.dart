import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<TableRow> children;
  final int column;
  const CustomTable({super.key, required this.children, required this.column});

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.symmetric(
            inside: const BorderSide(width: 1, color: Colors.black)),
        columnWidths: columnWidth(),
        children: children);
  }

  Map<int, TableColumnWidth> columnWidth() {
    final a = <int, TableColumnWidth>{};
    for (int i = 0; i < column; i++) {
      a[i] = const FlexColumnWidth();
    }
    return a;
  }
}
