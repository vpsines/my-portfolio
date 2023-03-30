import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/models/section.dart';
import 'package:my_portfolio/widgets/header/header_item.dart';

class Header extends StatelessWidget {
  final ValueNotifier<Section?> sectionNotifier;

  const Header({super.key, required this.sectionNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: sectionNotifier,
        builder: (context, value, child) {
          return SizedBox(
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
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.aboutSection,
                          index: 1,
                          source: UpdateSource.click);
                    }),
                HeaderItem(
                    name: AppConstants.experienceSection,
                    isSelected: sectionIndex == 2,
                    sectionNotifier: sectionNotifier,
                    onTap: () {
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.experienceSection,
                          index: 2,
                          source: UpdateSource.click);
                    }),
                HeaderItem(
                    name: AppConstants.projectSection,
                    isSelected: sectionIndex == 3,
                    sectionNotifier: sectionNotifier,
                    onTap: () {
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.projectSection,
                          index: 3,
                          source: UpdateSource.click);
                    }),
                HeaderItem(
                    name: AppConstants.contactSection,
                    isSelected: sectionIndex == 4,
                    sectionNotifier: sectionNotifier,
                    onTap: () {
                      sectionNotifier.value = Section(
                          sectionName: AppConstants.contactSection,
                          index: 4,
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
