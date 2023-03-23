import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/data_provider.dart';
import 'package:my_portfolio/widgets/body/about/profile_avatar.dart';
import 'package:my_portfolio/widgets/body/about/skills_bar.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<DataProvider>(
      builder: (_, dataProvider, child) {
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
                          child: (dataProvider.profile != null)
                              ? Text(
                                  dataProvider.profile!.about,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                )
                              : const CircularProgressIndicator(),
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
      },
    );
  }
}
