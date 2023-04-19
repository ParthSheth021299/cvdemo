import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/education_detail_model.dart';

class EducationDetailProvider with ChangeNotifier {
  List<EducationDetailModel> educationDetailList = [];

  List<EducationDetailModel> get item {
    return [...educationDetailList];
  }

  Future<void> addEducationDetail(String course, String school, String grade,
      String year) async {
    try {
      ///https://cv-creator-ff265-default-rtdb.firebaseio.com/

      const url =
          'https://cv-creator-ff265-default-rtdb.firebaseio.com/educationdetails.json';
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'courseName': course,
            'school': school,
            'grade': grade,
            'year': year,
          }));
      final newEducationDetail = EducationDetailModel(
          id: json.decode(response.body)['name'],
          course: course,
          school: school,
          grade: grade,
          year: year,
          );
      educationDetailList.insert(0, newEducationDetail);
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> fetchList() async {}
}
