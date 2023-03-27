import 'package:cloud_firestore/cloud_firestore.dart';

class Profile{
final String about;
  final String profileUrl;
  final List<String> skills;

  Profile(
      {required this.about,
      required this.profileUrl,
      required this.skills});

  Profile.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot)
      : this(
            about: documentSnapshot.get("about"),
            profileUrl: documentSnapshot.get("profileUrl"),
            skills: documentSnapshot.get("skills").map<String>((e) => e as String).toList()
            );
}

