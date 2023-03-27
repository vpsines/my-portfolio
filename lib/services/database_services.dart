import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/models/profile.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/models/work_experience.dart';

class DatabaseServices {
  static const String projectCollection = "Projects";
  static const String experienceCollection = "Experiences";
  static const String infoCollection = 'Info';

  static const String profileDocument = "about";

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Project>> fetchProjects() {
    return firestore.collection(projectCollection).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Project.fromDocumentSnapshot(doc)).toList());
  }

  Stream<List<WorkExperience>> getWorkExperiences() {
    return firestore.collection(experienceCollection).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => WorkExperience.fromDocumentSnapshot(doc))
            .toList());
  }

  Future<Profile> getProfile() async {
    try {
      return await firestore
          .collection(infoCollection)
          .doc(profileDocument)
          .get()
          .then((value) {
        return Profile.fromDocumentSnapshot(value);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Project>> getProjects() async {
    try {
      return await firestore.collection(projectCollection).get().then((value) {
        return value.docs.map((e) => Project.fromDocumentSnapshot(e)).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveToFirestore() async {
    try {
      final json = await rootBundle.loadString('data.json');
      final encodedJson = jsonDecode(json);

      for(var i in encodedJson){
        await firestore.collection(projectCollection).add(i);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
