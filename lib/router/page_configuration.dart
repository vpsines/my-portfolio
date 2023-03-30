class PageConfiguration {
  final String? sectionName;
  final bool unknown;

  PageConfiguration.home()
      : sectionName = null,
        unknown = false;

  PageConfiguration.page({required this.sectionName})
      : unknown = false;

  PageConfiguration.unknown()
      : unknown = true,
        sectionName = null;

  bool get isUnknown => unknown == true;

  bool get isHomePage => unknown == false && sectionName == null;

  bool get isPage => unknown == false && sectionName != null;

}
