import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  static const String pageName = 'intro';

  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.1, bottom: 50),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Hi, my name is",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Vyshnav Sasidharan",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                    letterSpacing: 1.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "A developer focused on building cross-platform applications using Flutter.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
