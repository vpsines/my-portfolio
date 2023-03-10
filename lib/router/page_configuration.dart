class PageCongiuration {
  final String? pageName;
  final bool unknown;

  PageCongiuration.home({required pageName})
      : pageName = pageName,
        unknown = false;

  PageCongiuration.unknown()
      : unknown = true,
        pageName = null;

  bool get isUnknown => unknown == true;

  bool get isHomePage => unknown == false && pageName != null;
}
