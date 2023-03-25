import 'package:flutter/material.dart';

class UserUtils extends ChangeNotifier{

  bool isSignin = true;

  // country code picker
  String? dialCode;
  Widget? countryFlag;

  void setCountryCode(String code,Widget flag){
    dialCode = code;
    countryFlag = flag;
    update();
  }

  update(){
    notifyListeners();
  }

}