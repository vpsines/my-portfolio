import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/router/page_configuration.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/screens/unknown_screen.dart';

class PageRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<String> pages;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  late Page _homePage;

// app state fields
  final ValueNotifier<String?> _pageNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultPage => pages.first;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  PageRouterDelegate({required this.pages}) {
    // initialize home page

    _homePage = const MaterialPage(
      key: ValueKey<String>("Homepage"),
      child: HomeScreen(),
    );

    // add listeners
    Listenable.merge([_pageNotifier, _unknownStateNotifier]).addListener(() {
      if (kDebugMode) {
        print('notifying router widget');
      }
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              const MaterialPage(
                  key: ValueKey<String>("Unknown"), child: UnkownScreen())
            ]
          : [],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    if (configuration.isUnknown) {
      _unknownStateNotifier.value = true;
      _pageNotifier.value = null;
    } else {
      _unknownStateNotifier.value = false;
      _pageNotifier.value = configuration.pageName ?? defaultPage;
    }
  }

  @override
  PageConfiguration? get currentConfiguration {
    // if unknown is true, return unknown configuration
    if (_unknownStateNotifier.value == true) {
      return PageConfiguration.unknown();
    } else {
      // if pageName exists return page configuration, else return home configuration
      if (_pageNotifier.value == null) {
        return PageConfiguration.home();
      } else {
        return PageConfiguration.page(pageName: _pageNotifier.value);
      }
    }
  }
}
