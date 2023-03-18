import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const HeaderItem({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
