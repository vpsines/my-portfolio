import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/body/about/about.dart';
import 'package:my_portfolio/widgets/body/contact/contact.dart';
import 'package:my_portfolio/widgets/body/experiences/experiences.dart';
import 'package:my_portfolio/widgets/body/intro/intro.dart';
import 'package:my_portfolio/widgets/body/projects/projects.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: const [
              IntroWidget(),
              About(),
              Experiences(),
              Projects(),
              Contact(),
            ],
          ),
        ),
      ),
    );
  }
}
