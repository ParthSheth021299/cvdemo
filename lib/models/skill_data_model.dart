import 'package:flutter/cupertino.dart';

/**
 * Created by Parth Sheth.
 * Created on 18/04/23 at 11:22 am
 */

class SkillDataModel {

  final String? id;
  final List<String>? skill;
  final List<double>? skillLevel;

  SkillDataModel({
    @required this.id,
    @required this.skill,
    @required this.skillLevel
});

}