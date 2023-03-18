import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/body/projects/project_tile.dart';
import 'package:my_portfolio/widgets/body/projects/recent_project_item.dart';

class Projects extends StatefulWidget {
  static const String pageName = 'projects';

  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isMorePressed = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "My Recent works",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1),
        ),
        SizedBox(
          height: size.height * 0.075,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return RecentProjectItem(
              isLeftAlign: index % 2 == 0 ? false : true,
            );
          },
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        const Text(
          "Other exciting works",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        SizedBox(
          width: double.infinity,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 2.75),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isMorePressed ? 12 : 6,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ProjectTile();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
            onPressed: () {
              setState(() {
                isMorePressed = !isMorePressed;
              });
            },
            child: Text(
              isMorePressed ? "Show Less" : "Show More",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1),
            ),
          ),
        )
      ],
    );
  }
}
