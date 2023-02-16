import 'package:flutter/material.dart';

class ProjectTile extends StatefulWidget {
  const ProjectTile({super.key});

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  bool isHovering = false;
  final List<String> usedStacks = ["Flutter", "Node.js", "Visual Studio"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: 200,
      child: InkWell(
        onTap: () {},
        onHover: (bool value) {
          setState(() {
            isHovering = value;
          });
        },
        child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: size.width * 0.3,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/project.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedPositioned(
                curve: Curves.linear,
                bottom: isHovering ? 25 : 0,
                left: 20,
                
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Project 1",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      (isHovering)
                          ? const Text(
                              "Small description",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        height: 10,
                      ),
                      (isHovering)
                          ? SizedBox(
                              height: 20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: usedStacks.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16),
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
                            )
                          : Container(),
                    ],
                  ),
                )),
            Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.facebook_outlined,
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
