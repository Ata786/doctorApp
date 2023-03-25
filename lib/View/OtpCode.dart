import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../Components/MainButton.dart';
import '../Resources/R.dart';
import '../Routes/RoutesPath.dart';
import '../ViewModel/UserUtils.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserUtils utils = Provider.of(context,listen: false);

    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: myHeight,
          width: myWidth,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: myHeight / 40),
                  Row(
                    children: [
                      SizedBox(
                        width: myWidth / 20,
                      ),
                      Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: myWidth / 3.5,
                      ),
                      Text(
                        utils.isSignin == true ? 'Sign In' : 'Sign Up',
                        style: TextStyle(
                            fontSize: myHeight / 30,
                            color: R.colors.blackColor,
                            fontFamily: 'worksans',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: myHeight / 30),
                  Text(
                    'Enter Otp Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: myHeight / 30,
                        color: R.colors.blackColor,
                        fontFamily: 'worksans',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: myHeight / 100),
                  Padding(
                    padding:
                    EdgeInsets.only(left: myWidth / 20, right: myWidth / 20),
                    child: Text(
                      'We have send your code to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: myWidth / 40,
                          color: R.colors.smallTextColor,
                          fontFamily: 'worksans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: myHeight / 100),
                  Padding(
                    padding:
                    EdgeInsets.only(left: myWidth / 20, right: myWidth / 20),
                    child: Text(
                      '+880 9090900',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: myWidth / 40,
                          color: R.colors.blackColor,
                          fontFamily: 'worksans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: myHeight / 30),
                  Container(width: myWidth/1.2,
                  child: OTPTextField(
                    length: 4,
                    spaceBetween: 0,
                    otpFieldStyle: OtpFieldStyle(
                      enabledBorderColor: R.colors.themeColor,
                      focusBorderColor: R.colors.themeColor,
                      errorBorderColor: Colors.red
                    ),
                    fieldWidth: myWidth/8,
                    style: TextStyle(
                        fontSize: 17
                    ),
                    keyboardType: TextInputType.number,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),),
                  SizedBox(height: myHeight/30,),
                  mainButton(color: R.colors.themeColor,
                      text: 'Continue', height: myHeight, width: myWidth, textColor: Colors.white, onTap: (){
                    if(utils.isSignin == false){
                      Navigator.pushNamedAndRemoveUntil(context, PagePath.USER_DETAILS_PAGE, (route) => false);
                    }
                      }),
                  SizedBox(height: myHeight/40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Didn't receive a code? ",style: TextStyle(color: Colors.black,fontSize: myHeight/60,fontFamily: 'worksans'),),
                      InkWell(
                          onTap: (){

                          },
                          child: Text(' Send Again',style: TextStyle(color: R.colors.themeColor,fontWeight: FontWeight.w700,fontSize: myHeight/60,fontFamily: 'worksans'),))
                    ],
                  ),
            ]),
          ),
        ),
      ),
    );
  }
}
