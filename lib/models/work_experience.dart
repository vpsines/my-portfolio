import 'package:cloud_firestore/cloud_firestore.dart';

class WorkExperience {
  final String startingPeriod;
  final String endingPeriod;
  final String role;
  final String companyName;
  final List<String> points;

  WorkExperience(
      {required this.startingPeriod,
      required this.endingPeriod,
      required this.role,
      required this.companyName,
      required this.points});

  WorkExperience.fromDocumentSnapshot(DocumentSnapshot documentSnapshot)
      : this(
            startingPeriod: documentSnapshot.get("startingPeriod"),
            endingPeriod: documentSnapshot.get("endingPeriod"),
            role: documentSnapshot.get("role"),
            companyName: documentSnapshot.get("companyName"),
            points: documentSnapshot.get("points").map<String>((e) => e as String).toList() ?? []);
}
