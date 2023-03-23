import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String name;
  final String description;
  final List<String> techStacks;
  final bool isAvailableOnPlaystore;
  final String playStoreUrl;
  final String githubUrl;
  final bool isAvailableOnGithub;
  final String backgroundUrl;
  final List<String> screenshots;
  final List<String> summaryPoints;
  final bool isTopThree;

  Project(
      {required this.name,
      required this.description,
      required this.techStacks,
      required this.isAvailableOnPlaystore,
      required this.playStoreUrl,
      required this.githubUrl,
      required this.isAvailableOnGithub,
      required this.backgroundUrl,
      required this.screenshots,
      required this.summaryPoints,
      required this.isTopThree});

  Project.fromDocumentSnapshot(QueryDocumentSnapshot<Map<String,dynamic>> documentSnapshot)
      : this(
            name: documentSnapshot.get("name"),
            description: documentSnapshot.get("description"),
            techStacks: documentSnapshot.get("techStacks"),
            isAvailableOnPlaystore:
                documentSnapshot.get("isAvailableOnPlaystore"),
            playStoreUrl: documentSnapshot.get("playStoreUrl"),
            githubUrl: documentSnapshot.get("githubUrl"),
            isAvailableOnGithub: documentSnapshot.get("isAvailableOnGithub"),
            backgroundUrl: documentSnapshot.get("backgroundUrl"),
            screenshots: documentSnapshot.get("screenshots"),
            summaryPoints: documentSnapshot.get("summaryPoints"),
            isTopThree: documentSnapshot.get("isTopThree"));
}
