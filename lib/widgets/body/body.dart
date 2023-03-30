import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/models/section.dart';
import 'package:my_portfolio/widgets/body/about/about.dart';
import 'package:my_portfolio/widgets/body/contact/contact.dart';
import 'package:my_portfolio/widgets/body/experiences/experiences.dart';
import 'package:my_portfolio/widgets/body/intro/intro.dart';
import 'package:my_portfolio/widgets/body/projects/projects.dart';
import 'package:my_portfolio/widgets/footer/footer.dart';

class BodyWidget extends StatefulWidget {

  final ValueNotifier<Section?> sectionNotifier;

  const BodyWidget(
      {super.key,
      required this.sectionNotifier});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  final ScrollController _scrollController = ScrollController();
  List<GlobalKey> keys = [for (int i = 0; i < 5; i++) GlobalKey()];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToSection();
      widget.sectionNotifier.addListener(() {
        final isScroll = widget.sectionNotifier.value?.source == UpdateSource.scroll;

        if (_scrollController.hasClients && !isScroll) {
          scrollToSection();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              onUserScrolled(notification.metrics.pixels);
            }
            return true;
          },
          child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.08),
                    child: Column(
                      children: [
                        IntroWidget(
                          key: keys[0],
                        ),
                        About(
                          key: keys[1],
                        ),
                        Experiences(
                          key: keys[2],
                        ),
                        Projects(
                          key: keys[3],
                        ),
                        Contact(
                          key: keys[4],
                        ),
                      ],
                    ),
                  ),
                  const Footer()
                ],
              )),
        ));
  }

  void scrollToSection() {
    Scrollable.ensureVisible(
      keys[widget.sectionNotifier.value == null ? 0:widget.sectionNotifier.value!.index].currentContext!,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onUserScrolled(double offset) {
    double totalItemHeight = 0;
    for (int i = 0; i < keys.length; i++) {
      totalItemHeight += keys[i].currentContext!.size!.height;
      if (totalItemHeight >= offset) {
        final index = i;
        var sectionName = AppConstants.aboutSection;

        if(index == 1){
          sectionName = AppConstants.aboutSection;
        }else if(index == 2){
          sectionName = AppConstants.experienceSection;

        }else if(index == 3){
          sectionName = AppConstants.projectSection;

        }else if(index == 4){
          sectionName = AppConstants.contactSection;

        }else{
          sectionName = AppConstants.introSection;
        }
        widget.sectionNotifier.value = Section(sectionName: sectionName, source: UpdateSource.scroll, index: index);
        break;
      }
    }
  }
}
