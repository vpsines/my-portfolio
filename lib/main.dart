import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constants.dart';
import 'package:my_portfolio/router/page_route_information_parser.dart';
import 'package:my_portfolio/router/page_router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageRouterDelegate pageRouterDelegate;
  late PageRouteInformationParser pageRouteInformationParser;
  final _pages = AppConstants.validPages;

  @override
  void initState() {
    super.initState();
    pageRouterDelegate = PageRouterDelegate(pages: _pages);
    pageRouteInformationParser = PageRouteInformationParser(routes: _pages);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: pageRouterDelegate,
      routeInformationParser: pageRouteInformationParser,
    );
  }
}
