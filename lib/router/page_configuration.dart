class PageConfiguration {
  final String? pageName;
  final bool unknown;

  PageConfiguration.home()
      : pageName = null,
        unknown = false;

  PageConfiguration.page({required pageName})
      : pageName = pageName,
        unknown = false;

  PageConfiguration.unknown()
      : unknown = true,
        pageName = null;

  bool get isUnknown => unknown == true;

  bool get isHomePage => unknown == false && pageName == null;

  bool get isPage => unknown == false && pageName != null;

}
