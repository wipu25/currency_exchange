import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color bgColor;
  final double? fontSize;
  final EdgeInsets padding;
  const CustomButton(
      {super.key,
      this.onPressed,
      this.padding = const EdgeInsets.all(8.0),
      required this.text,
      required this.bgColor,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(bgColor)),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: padding,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )));
  }
}

class CustomIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Color bgColor;
  final double? fontSize;
  final EdgeInsets padding;
  const CustomIconButton(
      {super.key,
      this.onPressed,
      this.padding = const EdgeInsets.all(2.0),
      required this.child,
      required this.bgColor,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(bgColor)),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: padding,
            child: child));
  }
}
