import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/body/about/profile_avatar.dart';
import 'package:my_portfolio/widgets/body/about/skills_bar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.025),
              child: const Text(
                "About me",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: const Text(
                        "I am Steven Miller, and I am looking for a job in Customer Services. I have 10 years of experience in related job positions. I started working as a Customer Care Agent in a call center gradually moving to a Customer Experience Analyst. I am a team player. I am outgoing, dedicated, and open-minded. I get across to people and adjust to changes with ease. I believe that a person should work on developing their professional skills and learning new things all the time. Currently, I am looking for new career opportunities my current job position cannot provide. I have enough experience to occupy a managing position and I will be glad to work on increasing the customer loyalty rate of your company.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SkillsBar()
                  ],
                ),
                SizedBox(
                    width: size.width * 0.4,
                    height: size.height * 0.3,
                    child: const ProfileAvatar()),
              ],
            )
          ]),
    );
  }
}
