import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/models/section.dart';
import 'package:my_portfolio/widgets/header/header_item.dart';

class Header extends StatefulWidget {
  final ValueNotifier<int?> navItemNotifier;
  final ValueNotifier<bool> isHeaderItemPressed;

  final ValueNotifier<Section?> sectionNotifier;

  const Header(
      {super.key,
      required this.navItemNotifier,
      required this.isHeaderItemPressed,
      required this.sectionNotifier});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    super.initState();
    widget.sectionNotifier.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeaderItem(
            name: AppConstants.aboutSection,
            onTap: () {
              widget.navItemNotifier.value = 1;
              widget.isHeaderItemPressed.value = true;
            },
            sectionNotifier: widget.sectionNotifier,
            isSelected: sectionIndex == 1,
          ),
          HeaderItem(
            name:  AppConstants.experienceSection,
            onTap: () {
              widget.navItemNotifier.value = 2;
              widget.isHeaderItemPressed.value = true;
            },
            sectionNotifier: widget.sectionNotifier,
            isSelected: sectionIndex == 2,
          ),
          HeaderItem(
            name:  AppConstants.projectSection,
            onTap: () {
              widget.navItemNotifier.value = 3;
              widget.isHeaderItemPressed.value = true;
            },
            sectionNotifier: widget.sectionNotifier,
            isSelected: sectionIndex == 3,
          ),
          HeaderItem(
            name:  AppConstants.contactSection,
            onTap: () {
              widget.navItemNotifier.value = 4;
              widget.isHeaderItemPressed.value = true;
            },
            sectionNotifier: widget.sectionNotifier,
            isSelected: sectionIndex == 4,
          ),
        ],
      ),
    );
  }

  // returns index of current section
  int get sectionIndex {
    final sectionName = widget.sectionNotifier.value?.sectionName;
    final index = AppConstants.sections
        .indexWhere((element) => element.sectionName == sectionName);
    return index > -1 ? index : 0;
  }
}
