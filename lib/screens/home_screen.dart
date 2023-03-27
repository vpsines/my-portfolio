import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  final ValueNotifier<String?> currentPageNotifier;
  const HomeScreen({super.key, required this.currentPageNotifier});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<int?> headerNotifier;
  final ValueNotifier<bool> isHeaderItemPressed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    setPageIndex();
        loadData();
  }

  Future<void> loadData() async{
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
                  navItemNotifier: headerNotifier,
                  isHeaderItemPressed: isHeaderItemPressed,
                ))),
        body: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: isHeaderItemPressed,
                builder: (BuildContext context, bool? value, Widget? child) {
                  return BodyWidget(
                    pageNotifier: headerNotifier,
                    isHeaderItemPressed: isHeaderItemPressed,
                  );
                }),
            Positioned(
                left: 0,
                top: MediaQuery.of(context).size.height * 0.3,
                child: SocialBar(
                  isFooter: false,
                ))
          ],
        ));
  }

  void setPageIndex() {
    int index = 0;

    if (widget.currentPageNotifier.value != null) {
      switch (widget.currentPageNotifier.value) {
        case IntroWidget.pageName:
          index = 0;
          break;
        case About.pageName:
          index = 1;
          break;
        case Experiences.pageName:
          index = 2;
          break;
        case Projects.pageName:
          index = 3;
          break;
        case Contact.pageName:
          index = 4;
          break;
        default:
          index = 4;
          break;
      }
    }

    setState(() {
      headerNotifier = ValueNotifier(index);
    });
  }
}
