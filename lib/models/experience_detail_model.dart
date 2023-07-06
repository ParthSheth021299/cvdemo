import 'package:flutter/foundation.dart';


class ExperienceDetailModel {
  final String? id;
  final String? company;
  final String? job;
  final String? startDate;
  final String? endDate;
  final String? details;

  ExperienceDetailModel({
    @required this.id,
    @required this.company,
    @required this.job,
    @required this.startDate,
    @required this.endDate,
    @required this.details,
  });
}
