import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/custom_app_icons.dart';
import 'package:my_portfolio/utils/url_launcher_utils.dart';
import 'package:my_portfolio/widgets/base/custom_icon_button.dart';

class SocialBar extends StatelessWidget {
  final bool isFooter;

  SocialBar({super.key, this.isFooter = false});

  final List<Widget> socialIcons = [
    CustomIconButton(
      onTap: () async {
        await viewGitHubProfile();
      },
      icon: CustomAppIcons.github,
    ),
    CustomIconButton(
      onTap: () async {
        await viewLinkedInProfile();
      },
      icon: CustomAppIcons.linkedin,
    ),
    CustomIconButton(
      onTap: () async {
        await viewInstagram();
      },
      icon: CustomAppIcons.instagram,
    ),
    CustomIconButton(
      onTap: () async {
        await viewFreeCodeCamp();
      },
      icon: CustomAppIcons.free_code_camp,
    ),
    CustomIconButton(
      onTap: () async {
        await viewLeetcode();
      },
      icon: CustomAppIcons.leetcode,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.transparent,
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
