import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/header/header_item.dart';

class Header extends StatelessWidget {
  final ValueNotifier<int?> navItemNotifier;
  final ValueNotifier<bool> isHeaderItemPressed;

  const Header(
      {super.key,
      required this.navItemNotifier,
      required this.isHeaderItemPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeaderItem(
              name: "ABOUT",
              onTap: () {
                navItemNotifier.value = 1;
                isHeaderItemPressed.value = true;
              }),
          HeaderItem(
              name: "EXPERIENCES",
              onTap: () {
                navItemNotifier.value = 2;
                isHeaderItemPressed.value = true;
              }),
          HeaderItem(
              name: "PROJECTS",
              onTap: () {
                navItemNotifier.value = 3;
                isHeaderItemPressed.value = true;
              }),
          HeaderItem(
              name: "CONTACT",
              onTap: () {
                navItemNotifier.value = 4;
                isHeaderItemPressed.value = true;
              }),
        ],
      ),
    );
  }
}
