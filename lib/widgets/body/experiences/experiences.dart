import 'package:flutter/material.dart';
import 'package:my_portfolio/models/work_experience.dart';
import 'package:my_portfolio/providers/data_provider.dart';
import 'package:provider/provider.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        return SizedBox(
          height: size.height,
          child: Column(
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
              StreamBuilder<List<WorkExperience>>(
                stream: dataProvider.loadExperiences(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState != ConnectionState.waiting &&
                      snapshot.data != null) {
                    return (snapshot.hasData)
                        ? SizedBox(
                            height: size.height * 0.6,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: size.width * 0.1,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => onTap(index),
                                        child: Container(
                                          width: size.width * 0.1,
                                          height: size.height * 0.05,
                                          decoration: BoxDecoration(
                                              color: (currentIndex == index)
                                                  ? Colors.white
                                                  : Colors.black12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              (index == currentIndex)
                                                  ? Container(
                                                      color: Colors.black,
                                                      width: 3,
                                                      height: double.infinity,
                                                    )
                                                  : Container(),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "${index + 1}",
                                                    style: TextStyle(
                                                        color: (currentIndex ==
                                                                index)
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.025,
                                      top: size.height * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: snapshot
                                                .data![currentIndex].role,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                letterSpacing: 1),
                                            children: [
                                              TextSpan(
                                                text: snapshot
                                                    .data![currentIndex]
                                                    .companyName,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    letterSpacing: 1),
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.015,
                                      ),
                                      Text(
                                        "${snapshot.data![currentIndex].startingPeriod} - ${snapshot.data![currentIndex].endingPeriod}",
                                        style: const TextStyle(
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
                        : Center(
                            child: Text(snapshot.error.toString()),
                          );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator( color: Colors.black,),
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
