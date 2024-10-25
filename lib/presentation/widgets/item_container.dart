import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final double? width;
  const ItemContainer(
      {super.key,
      required this.child,
      this.borderRadius,
      this.padding = const EdgeInsets.all(4.0),
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                offset: const Offset(2, 2),
                color: Colors.black.withOpacity(0.2))
          ]),
      child: child,
    );
  }
}
