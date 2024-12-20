import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  final String text;
  final double fontSize;
  const HeaderCell({super.key, required this.text, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
