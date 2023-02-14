import 'package:flutter/material.dart';

class Experiences extends StatelessWidget {
  const Experiences({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Where I'have worked",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1),
        ),
        SizedBox(
              height: size.height * 0.075,
            ),
        Container(
          height: size.height * 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.1,
                      height: size.height * 0.05,
                      decoration: const BoxDecoration(color: Colors.black12),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: size.width * 0.025,top: size.height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    RichText(
                      
                      text: const TextSpan(
                          text: "Backend Developer ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1),
                          children: [
                            TextSpan(
                              text: "@ Mars Inc.",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 1),
                            )
                          ]),
                    ),
                    SizedBox(height: size.height * 0.015,),
                    const Text(
                      "January 2020 - February 2020",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 1),
                    ),
                ],
              ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
