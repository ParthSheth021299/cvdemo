import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/personal_detail_model.dart';

/**
 * Created by Parth Sheth.
 * Created on 11/04/23 at 6:02 PM
 */
class PersonalDetailProvider with ChangeNotifier {
  List<PersonalDetailModel> personalDetailList = [];

  List<PersonalDetailModel> get item {
    return [...personalDetailList];
  }

  Future<void> addPersonalDetail(String name, String address, String email,
      String phone, String photoUrl) async {
    try {
      ///https://cv-creator-ff265-default-rtdb.firebaseio.com/

      const url =
          'https://cv-creator-ff265-default-rtdb.firebaseio.com/personaldetails.json';
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'userName': name,
            'address': address,
            'email': email,
            'phone': phone,
            'photoUrl': photoUrl
          }));
      final newPersonalDetail = PersonalDetailModel(
          id: json.decode(response.body)['name'],
          name: name,
          address: address,
          email: email,
          phone: phone,
          photoUrl: photoUrl);
      personalDetailList.insert(0, newPersonalDetail);
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> fetchList() async {}
}
