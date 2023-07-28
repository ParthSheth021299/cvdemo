import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/project_detail_model.dart';

class ProjectDetailProvider with ChangeNotifier {
  List<ProjectDetailModel> projectDetailList = [];

  List<ProjectDetailModel> get item {
    return [...projectDetailList];
  }

  Future<void> addProjectDetail(List<ProjectDetailModel> project) async {
    try {
      ///https://cv-creator-ff265-default-rtdb.firebaseio.com/

      const url =
          'https://cv-creator-ff265-default-rtdb.firebaseio.com/projectdetails.json';
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'Project': project
                .map((projects) => {
              'id': projects.id,
              'title': projects.title,
              'description': projects.description,
            })
                .toList(),
          }));
      final newProjectDetail = ProjectDetailModel(
        id: json.decode(response.body)['name'],
        title: project.map((e) => e.title).toString(),
        description: project.map((e) => e.description).toString(),
      );
      projectDetailList.insert(0, newProjectDetail);
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> fetchList() async {
    const url =
        'https://cv-creator-ff265-default-rtdb.firebaseio.com/projectdetails.json';
    final response = await http.get(Uri.parse(url));
    print('Response-->${response.body[0]}');
  }
}
