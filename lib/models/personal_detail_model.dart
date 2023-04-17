import 'package:flutter/foundation.dart';

/**
 * Created by Parth Sheth.
 * Created on 13/04/23 at 4:13 PM
 **/

class PersonalDetailModel {
  final String? id;
  final String? name;
  final String? address;
  final String? email;
  final String? phone;
  final String? photoUrl;

  PersonalDetailModel({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.email,
    @required this.phone,
    @required this.photoUrl,
  });
}
