import 'dart:convert';
import 'package:cvdemo/models/skill_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

/**
 * Created by Parth Sheth.
 * Created on 18/04/23 at 11:24 am
 */

class SkillDataProvider with ChangeNotifier {

  List<SkillDataModel> skillDataList = [];

  List<SkillDataModel> get item {
    return [...skillDataList];
  }

  Future<void> addSkillDetail(List<String> skill, List<String> skillLevel,) async {
    try {
      ///https://cv-creator-ff265-default-rtdb.firebaseio.com/

      const url =
          'https://cv-creator-ff265-default-rtdb.firebaseio.com/skilldata.json';
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'skill': skill,
            'skilllevel': skillLevel,
          }));
      final newSkillData = SkillDataModel(
          id: json.decode(response.body)['name'],
          skill: skill,
          skillLevel: skillLevel,
          );
      skillDataList.insert(0, newSkillData);
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> fetchList() async {}

}