import 'package:my_portfolio/models/section.dart';
import 'package:my_portfolio/widgets/body/about/about.dart';
import 'package:my_portfolio/widgets/body/contact/contact.dart';
import 'package:my_portfolio/widgets/body/experiences/experiences.dart';
import 'package:my_portfolio/widgets/body/intro/intro.dart';
import 'package:my_portfolio/widgets/body/projects/projects.dart';

class AppConstants {
  static List<String> validSections = [
    IntroWidget.pageName,
    About.pageName,
    Experiences.pageName,
    Projects.pageName,
    Contact.pageName
  ];

  static List<Section> sections = [
    Section(sectionName: introSection, source: UpdateSource.none, index: 0),
    Section(sectionName: aboutSection, source: UpdateSource.none, index: 1),
    Section(sectionName: experienceSection, source: UpdateSource.none, index: 2),
    Section(sectionName: projectSection, source: UpdateSource.none, index: 3),
    Section(sectionName: contactSection, source: UpdateSource.none, index: 4),
  ];

  static const String introSection = 'INTRO';

  static const String aboutSection = 'ABOUT';
  static const String experienceSection = 'EXPERIENCES';
  static const String projectSection = 'PROJECTS';
  static const String contactSection = 'CONTACT';
}
