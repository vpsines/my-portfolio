import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/router/page_configuration.dart';
import 'package:my_portfolio/screens/unknown_screen.dart';

class PageRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  final List<String> sections;

  PageRouteInformationParser({required this.sections});

  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      // length == 0
      return PageConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      final sectionName = uri.pathSegments[0].toLowerCase();

      if (_isValidSections(sectionName)) {
        return PageConfiguration.page(sectionName: sectionName);
      } else {
        return PageConfiguration.unknown();
      }
    } else {
      return PageConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: UnkownScreen.routeName);
    } else {
      final sectionName = configuration.sectionName;
      if (sectionName != null) {
        return RouteInformation(location: '/$sectionName');
      } else {
        return const RouteInformation(location: '/');
      }
    }
  }

  bool _isValidSections(String sectionName) {
    return AppConstants.validSections.contains(sectionName);
  }
}
