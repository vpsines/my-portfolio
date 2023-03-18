import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/router/page_configuration.dart';
import 'package:my_portfolio/screens/unknown_screen.dart';

class PageRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  final List<String> routes;

  PageRouteInformationParser({required this.routes});

  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      // length == 0
      return PageConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      final pageName = uri.pathSegments[0].toLowerCase();

      if (_isValidPages(pageName)) {
        return PageConfiguration.page(pageName: pageName);
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
      final pageName = configuration.pageName;
      if (pageName != null) {
        return RouteInformation(location: '/$pageName');
      } else {
        return const RouteInformation(location: '/');
      }
    }
  }

  bool _isValidPages(String pageName) {
    return AppConstants.validPages.contains(pageName);
  }
}
