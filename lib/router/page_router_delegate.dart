import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/models/section.dart';
import 'package:my_portfolio/providers/data_provider.dart';
import 'package:my_portfolio/router/page_configuration.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/screens/unknown_screen.dart';
import 'package:provider/provider.dart';

class PageRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<String> sections;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  late Page _homePage;

// app state fields
  final ValueNotifier<String?> _pageNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);
  final ValueNotifier<Section?> _sectionNotifier = ValueNotifier(null);

  String get defaultPage => sections.first;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  PageRouterDelegate({required this.sections}) {
    // initialize home page

    _homePage = MaterialPage(
      key: const ValueKey<String>("Homepage"),
      child: ChangeNotifierProvider<DataProvider>(
        create: (context) => DataProvider(),
        child: HomeScreen(
          currentPageNotifier: _pageNotifier,
          sectionNotifier: _sectionNotifier,
        ),
      ),
      //child: HomeScreen(currentPageNotifier: _pageNotifier,),
    );

    // add listeners
    Listenable.merge([_pageNotifier, _sectionNotifier, _unknownStateNotifier])
      .addListener(() {
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
          : [_homePage],
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
      _sectionNotifier.value = null;
    } else {
      _unknownStateNotifier.value = false;
      final sectionName =
          (configuration.sectionName ?? defaultPage).toLowerCase();
      final section = AppConstants.sections.firstWhere(
          (element) => element.sectionName.toLowerCase() == sectionName);
      _sectionNotifier.value = Section(
          sectionName: section.sectionName,
          source: UpdateSource.addressBar,
          index: section.index);
    }
  }

  @override
  PageConfiguration? get currentConfiguration {
    // if unknown is true, return unknown configuration
    if (_unknownStateNotifier.value == true) {
      return PageConfiguration.unknown();
    } else {
      // if pageName exists return page configuration, else return home configuration
      if (_sectionNotifier.value == null) {
        return PageConfiguration.home();
      } else {
        return PageConfiguration.page(
            sectionName: _sectionNotifier.value?.sectionName.toLowerCase());
      }
    }
  }
}
