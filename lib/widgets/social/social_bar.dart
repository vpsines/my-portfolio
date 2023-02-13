import 'package:flutter/material.dart';

class SocialBar extends StatelessWidget {
  final bool isFooter;

  SocialBar({super.key, this.isFooter = false});

  final List<Widget> socialIcons = [
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.facebook,
          size: 32,
          color: Colors.black,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.facebook,
          size: 32,
          color: Colors.black,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.facebook,
          size: 32,
          color: Colors.black,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.facebook,
          size: 32,
          color: Colors.black,
        )),
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.facebook,
          size: 32,
          color: Colors.black,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Material(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: (isFooter)
            ? Row(
                children: socialIcons,
              )
            : SizedBox(
              height: 250,
              width: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: socialIcons,
                  ),
              ),
            ),
      ),
    );
  }
}
