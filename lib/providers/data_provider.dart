import 'package:flutter/foundation.dart';
import 'package:my_portfolio/models/profile.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/models/work_experience.dart';
import 'package:my_portfolio/services/database_services.dart';

class DataProvider extends ChangeNotifier {
  final DatabaseServices databaseServices = DatabaseServices();

  Profile? _profile;
  List<Project>? _projects;
  List<WorkExperience>? _experiences;
  List<Project> _recentProjects = [];
  List<Project> _otherProjects = [];

  Profile? get profile => _profile;
  List<Project>? get projects => _projects;
  List<WorkExperience>? get experiences => _experiences;

  // updates profile data
  void updateProfile(Profile newProfile) {
    _profile = newProfile;
    notifyListeners();
  }

  // updates experiences
  void updateExperiences(List<WorkExperience> workExperiences) {
    _experiences = workExperiences;
    notifyListeners();
  }

  // updates project list
  void updateProjects(List<Project> newProjects) {
    _projects = newProjects;
    notifyListeners();
  }

  // initialize data
  Future<void> initData() async {
    await getProfile();
    await getProjects();
  }

  // streams experiences from firestore
  Stream<List<WorkExperience>> loadExperiences() {
    return databaseServices.getWorkExperiences();
  }

  // streams projects from firestore
  Stream<List<Project>> loadProjects() {
    return databaseServices.fetchProjects();
  }

  // fetches data related to profile from firestore
  Future<void> getProfile() async {
    _profile = await databaseServices.getProfile();
    notifyListeners();
  }

  // gets project documents from firestore
  Future<void> getProjects() async {
    _projects = await databaseServices.getProjects();
    if (_projects != null) {
      for (var project in _projects!) {
        project.isTopThree
            ? _recentProjects.add(project)
            : _otherProjects.add(project);
      }
    }
  }

  // get recent projects
  void getRecentProjects() {
    _recentProjects = _projects != null
        ? _projects!.where((element) => element.isTopThree).toList()
        : [];
  }

  // get other projects
  void getOtherProjects() {
    _otherProjects = _projects != null
        ? _projects!.where((element) => !element.isTopThree).toList()
        : [];
  }

  List<Project> get recentProjects {
    if (_recentProjects.isEmpty) {
      getRecentProjects();
    }
    return _recentProjects;
  }

  List<Project> get otherProjects {
    if (_otherProjects.isEmpty) {
      getOtherProjects();
    }
    return _otherProjects;
  }
}
