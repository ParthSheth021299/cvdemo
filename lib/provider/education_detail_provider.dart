import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/education_detail_model.dart';

class EducationDetailProvider with ChangeNotifier {
  List<EducationDetailModel> educationDetailList = [];

  List<EducationDetailModel> get item {
    return [...educationDetailList];
  }

  Future<void> addEducationDetail(List<EducationDetailModel> education) async {
    try {
      ///https://cv-creator-ff265-default-rtdb.firebaseio.com/

      const url =
          'https://cv-creator-ff265-default-rtdb.firebaseio.com/educationdetails.json';
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'courseName': education
              .map((educations) => {
          'id': educations.id,
          'courseName': educations.course,
          'school': educations.school,
          'grade': educations.grade,
          'year': educations.year
          })
              .toList(),
          }));
      final newEducationDetail = EducationDetailModel(
          id: json.decode(response.body)['name'],
        course: '',
        school: '',
        grade: '',
        year: '',
          );
      educationDetailList.insert(0, newEducationDetail);
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> fetchList() async {}
}
