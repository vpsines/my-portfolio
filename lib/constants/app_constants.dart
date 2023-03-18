import 'package:my_portfolio/widgets/body/about/about.dart';
import 'package:my_portfolio/widgets/body/contact/contact.dart';
import 'package:my_portfolio/widgets/body/experiences/experiences.dart';
import 'package:my_portfolio/widgets/body/intro/intro.dart';
import 'package:my_portfolio/widgets/body/projects/projects.dart';

class AppConstants {

  static List<String> validPages = [
    IntroWidget.pageName,
    About.pageName,
    Experiences.pageName,
    Projects.pageName,
    Contact.pageName
  ];

}
