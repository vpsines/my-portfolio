import 'package:equatable/equatable.dart';

class Section extends Equatable{
  final String sectionName;
  final UpdateSource source;

  Section({required this.sectionName,required this.source});

  @override
  List<Object?> get props => [sectionName,source];
}

enum UpdateSource{scroll,click,addressBar}
