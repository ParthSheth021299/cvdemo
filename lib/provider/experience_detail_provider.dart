import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/experience_detail_model.dart';

class ExperienceDetailProvider with ChangeNotifier {
  List<ExperienceDetailModel> experienceDetailList = [];

  List<ExperienceDetailModel> get item {
    return [...experienceDetailList];
  }

  Future<void> addExperienceDetail(List<ExperienceDetailModel> experience) async {
    try {
      ///https://cv-creator-ff265-default-rtdb.firebaseio.com/

      const url =
          'https://cv-creator-ff265-default-rtdb.firebaseio.com/experiencedetails.json';
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'Experience': experience
                .map((experiences) => {
              'id': experiences.id,
              'companyName': experiences.company,
              'job': experiences.job,
              'startDate': experiences.startDate,
              'endDate': experiences.endDate,
              'details': experiences.details,
            })
                .toList(),
          }));
      final newExperienceDetail = ExperienceDetailModel(
        id: json.decode(response.body)['name'],
        company: experience.map((e) => e.company).toString(),
        job: experience.map((e) => e.job).toString(),
        startDate: experience.map((e) => e.startDate).toString(),
        endDate: experience.map((e) => e.endDate).toString(),
        details: experience.map((e) => e.details).toString(),
      );
      experienceDetailList.insert(0, newExperienceDetail);
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> fetchList() async {}
}
