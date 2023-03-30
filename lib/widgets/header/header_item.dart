import 'package:flutter/material.dart';
import 'package:my_portfolio/models/section.dart';

class HeaderItem extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final ValueNotifier<Section?> sectionNotifier;
  final bool isSelected;

  const HeaderItem(
      {super.key,
      required this.name,
      required this.onTap,
      required this.sectionNotifier,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
