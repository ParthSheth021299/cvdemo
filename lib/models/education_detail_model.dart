import 'package:flutter/foundation.dart';


class EducationDetailModel {
  final String? id;
  final String? course;
  final String? school;
  final String? grade;
  final String? year;

  EducationDetailModel({
    @required this.id,
    @required this.course,
    @required this.school,
    @required this.grade,
    @required this.year,
  });
}
