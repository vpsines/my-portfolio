import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/models/section.dart';
import 'package:my_portfolio/widgets/header/header_item.dart';

class Header extends StatelessWidget {
  final ValueNotifier<int?> navItemNotifier;
  final ValueNotifier<bool> isHeaderItemPressed;

  final ValueNotifier<Section?> sectionNotifier;

  const Header(
      {super.key,
      required this.navItemNotifier,
      required this.isHeaderItemPressed,
      required this.sectionNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: sectionNotifier,
        builder: (context, value, child) {
          return Container(
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                HeaderItem(
                    name: AppConstants.aboutSection,
                    isSelected: sectionIndex == 1,
                    sectionNotifier: sectionNotifier,
                    onTap: () {
                      // navItemNotifier.value = 1;
                      // isHeaderItemPressed.value = true;
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.aboutSection,
                          source: UpdateSource.click);
                    }),
                HeaderItem(
                    name: AppConstants.experienceSection,
                    isSelected: sectionIndex == 2,
                    sectionNotifier: sectionNotifier,
                    onTap: () {
                      // navItemNotifier.value = 1;
                      // isHeaderItemPressed.value = true;
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.experienceSection,
                          source: UpdateSource.click);
                    }),
                HeaderItem(
                    name: AppConstants.projectSection,
                    isSelected: sectionIndex == 3,
                    sectionNotifier: sectionNotifier,
                    onTap: () {
                      // navItemNotifier.value = 1;
                      // isHeaderItemPressed.value = true;
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.projectSection,
                          source: UpdateSource.click);
                    }),
                HeaderItem(
                    name: AppConstants.contactSection,
                    isSelected: sectionIndex == 4,
                    sectionNotifier: sectionNotifier,
                    onTap: () {
                      // navItemNotifier.value = 1;
                      // isHeaderItemPressed.value = true;
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.contactSection,
                          source: UpdateSource.click);
                    }),
              ],
            ),
          );
        });
  }

  // returns index of current section
  int get sectionIndex {
    final sectionName = sectionNotifier.value?.sectionName;
    final index = AppConstants.sections
        .indexWhere((element) => element.sectionName == sectionName);
    return index > -1 ? index : 0;
  }
}
