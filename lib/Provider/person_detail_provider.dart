import 'package:flutter/material.dart';
import '../model/person_model.dart';

class PersonProvider with ChangeNotifier {
  PersonModel _personDetail = PersonModel();

  PersonModel get personDetail {
    return _personDetail;
  }

  Future<void> fetchDetail() async {
    await Future.delayed(Duration(seconds: 2));
    _personDetail = PersonModel(
        name: "Avnish",
        phoneNo: "8826331014",
        address: "H-330 A, Bloack-H, Dakshinpuri, New Delhi ",
        area: "South Delhi",
        pincode: "110062");
    notifyListeners();
  }
}
