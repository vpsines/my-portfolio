import 'package:flutter/material.dart';

class RecentProjectItem extends StatelessWidget {
  final bool isLeftAlign;
  
  RecentProjectItem({super.key, this.isLeftAlign = false});
  final List<String> usedStacks = ["Flutter", "Node.js", "Visual Studio"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: size.height * 0.05),
      child: Stack(
        alignment: isLeftAlign ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: isLeftAlign? size.width * 0.1:0,
              right: isLeftAlign? 0:size.width * 0.1,
              top: size.height * 0.02,
              bottom: size.height * 0.025,
            ),
            child: Container(
              width: size.width * 0.5,
              height: size.height * 0.6,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/website.png'),
                fit: BoxFit.fill,
              )),
            ),
          ),
          Positioned(
            top: size.height * 0.03,
            right: isLeftAlign ? 0: null,
            left: isLeftAlign ? null:0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Project 1",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.3,
                  child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              "Something about project tat i would like to know about.It is not so crrect but its wrong.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: usedStacks.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(right: 16),
                                  child: Text(
                                    usedStacks[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
