import 'package:flutter/foundation.dart';
import 'package:my_portfolio/models/profile.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/models/work_experience.dart';
import 'package:my_portfolio/services/database_services.dart';

class DataProvider extends ChangeNotifier{

  final DatabaseServices databaseServices = DatabaseServices();

  Profile? _profile;
  List<Project>? _projects;
  List<WorkExperience>? _experiences;

  Profile? get profile => _profile;
  List<Project>? get projects => _projects;
  List<WorkExperience>? get experiences => _experiences;

  // updates profile data
  void updateProfile(Profile newProfile){
    _profile = newProfile;
    notifyListeners();
  }

  // updates experiences
  void updateExperiences(List<WorkExperience> workExperiences){
    _experiences = workExperiences;
    notifyListeners();
  }

  // updates project list
    void updateProjects(List<Project> newProjects){
    _projects = newProjects;
    notifyListeners();
  }

  Stream<List<WorkExperience>> loadExperiences(){
    return databaseServices.getWorkExperiences();
  }

  Stream<List<Project>> loadProjects(){
    return databaseServices.getProjects();
  }

  Future<void> getProfile()async{
    _profile = await databaseServices.getProfile();
    notifyListeners();
  }
}