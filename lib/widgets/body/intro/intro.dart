import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Hi, my name is",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 14),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Vyshnav Sasidharan",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "A developer focused on building cross-platform applications using Flutter",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 14),
        )
      ],
    );
  }
}
