import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/data_provider.dart';
import 'package:my_portfolio/widgets/body/projects/project_tile.dart';
import 'package:my_portfolio/widgets/body/projects/recent_project_item.dart';
import 'package:provider/provider.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isMorePressed = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<DataProvider>(
      builder: (_,dataProvider,child){
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
          itemCount: dataProvider.recentProjects.length,
          itemBuilder: (context, index) {
            return RecentProjectItem(
              project: dataProvider.recentProjects[index],
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
            itemCount:dataProvider.otherProjects.length > 6 ? isMorePressed ? dataProvider.otherProjects.length  : 6 : dataProvider.otherProjects.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProjectTile(project:dataProvider.otherProjects[index]);
            },
          ),
        ),
        (dataProvider.otherProjects.length > 6)?Padding(
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
        ):Container()
      ],
    );
      },
    );
  }
}
