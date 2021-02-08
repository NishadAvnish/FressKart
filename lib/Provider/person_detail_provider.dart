import 'package:flutter/material.dart';
import '../model/person_model.dart';

class PersonProvider with ChangeNotifier {
  PersonModel _personDetail;

  PersonModel get personDetail {
    return _personDetail;
  }

  Future<void> fetchDetail() async {
    await Future.delayed(Duration(milliseconds: 00));
    // if (_personDetail == null) {
    //   await Future.delayed(Duration(milliseconds: 200));
    //   _personDetail = null;
    // }

    notifyListeners();
  }

  Future<void> logout() async {
    _personDetail = null;
    notifyListeners();
  }

  Future<void> login() async {
    if (_personDetail == null) {
      _personDetail = PersonModel(
          name: "Avnish",
          phoneNo: "8236817468",
          address: " New Delhi ",
          area: "South Delhi",
          pincode: "110062");
    }
    notifyListeners();
  }
}
