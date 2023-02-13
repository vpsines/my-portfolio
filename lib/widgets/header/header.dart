import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/header/header_item.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeaderItem(name: "ABOUT", onTap: () {}),
          HeaderItem(name: "EXPERIENCES", onTap: () {}),
          HeaderItem(name: "PROJECTS", onTap: () {}),
          HeaderItem(name: "CONTACT", onTap: () {}),
        ],
      ),
    );
  }
}
