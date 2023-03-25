import 'package:doctor_app/Routes/RoutesPath.dart';
import 'package:doctor_app/View/OtpCode.dart';
import 'package:doctor_app/View/PhoneNumber.dart';
import 'package:doctor_app/View/Signin.dart';
import 'package:doctor_app/View/UserDetails.dart';
import 'package:flutter/material.dart';

import '../View/Signup.dart';

class PageRoutes{


  static Route generateRoutes(RouteSettings settings){
    switch(settings.name){
      case PagePath.SIGNIN_PAGE:
        return MaterialPageRoute(builder: (context) => SignInPage());
        break;
      case PagePath.SIGNUP_PAGE:
        return MaterialPageRoute(builder: (context) => SignUpPage());
        break;
      case PagePath.PHONE_NUMBER_PAGE:
        return MaterialPageRoute(builder: (context) => PhoneNumber());
        break;
      case PagePath.OTP_CODE_PAGE:
        return MaterialPageRoute(builder: (context) => OtpScreen());
        break;
      case PagePath.USER_DETAILS_PAGE:
        return MaterialPageRoute(builder: (context) => UserDetails());
        break;
      default:
        return MaterialPageRoute(builder: (context) => MaterialApp(
          home: Scaffold(
            body: Center(child: Text('Routes not found'),),
          )
        ));
    }
  }

}