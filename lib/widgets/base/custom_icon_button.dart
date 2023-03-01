import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      this.size,
      this.color,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          size: size ?? 30,
          color: color ?? Colors.black,
        ));
  }
}
