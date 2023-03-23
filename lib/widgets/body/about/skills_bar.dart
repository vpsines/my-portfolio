import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/data_provider.dart';
import 'package:provider/provider.dart';

class SkillsBar extends StatelessWidget {
  SkillsBar({super.key});

  final skills = ["Flutter", "MySql", "Node.js"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<DataProvider>(builder: (context, dataProvider, child) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Skills",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        (dataProvider.profile != null)?Wrap(
          children: dataProvider.profile!.skills
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: size.height * 0.03,
                      width: size.width * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow:const [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 4,
                                color: Colors.black12)
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ):Container()
      ],
    );
    },);
  }
}
