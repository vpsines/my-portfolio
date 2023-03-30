import 'package:flutter/material.dart';
import 'package:my_portfolio/models/section.dart';
import 'package:my_portfolio/widgets/body/about/about.dart';
import 'package:my_portfolio/providers/data_provider.dart';
import 'package:my_portfolio/widgets/body/body.dart';
import 'package:my_portfolio/widgets/body/contact/contact.dart';
import 'package:my_portfolio/widgets/body/experiences/experiences.dart';
import 'package:my_portfolio/widgets/body/intro/intro.dart';
import 'package:my_portfolio/widgets/body/projects/projects.dart';
import 'package:my_portfolio/widgets/header/header.dart';
import 'package:my_portfolio/widgets/social/social_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<Section?> sectionNotifier;
  final ValueNotifier<String?> currentPageNotifier;
  const HomeScreen(
      {super.key,
      required this.sectionNotifier,
      required this.currentPageNotifier});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await context.read<DataProvider>().initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 75),
            child: AppBar(
                leadingWidth: 250,
                leading: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30,
                        ),
                      ),
                      Text("Vyshnav Sasidharan")
                    ],
                  ),
                ),
                title: Header(
                  sectionNotifier: widget.sectionNotifier,
                ))),
        body: Stack(
          children: [
            BodyWidget(
              sectionNotifier: widget.sectionNotifier,
            ),
            Positioned(
                left: 0,
                top: MediaQuery.of(context).size.height * 0.3,
                child: SocialBar(
                  isFooter: false,
                ))
          ],
        ));
  }
}
