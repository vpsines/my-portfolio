import 'package:equatable/equatable.dart';

class Section extends Equatable{
  final String sectionName;
  final UpdateSource source;
  final int index;

  Section({required this.sectionName,required this.source,required this.index});

  @override
  List<Object?> get props => [sectionName,source];
}

enum UpdateSource{scroll,click,addressBar,none}
