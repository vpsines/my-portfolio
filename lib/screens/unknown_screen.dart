import 'package:flutter/material.dart';

class UnkownScreen extends StatelessWidget {
  static const String routeName = '/unknown';

  const UnkownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "404 Page not found.",
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1),
      ),
    );
  }
}
