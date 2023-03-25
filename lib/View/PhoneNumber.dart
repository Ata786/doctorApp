import 'package:doctor_app/Components/MainButton.dart';
import 'package:doctor_app/Routes/RoutesPath.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Resources/R.dart';
import '../ViewModel/UserUtils.dart';

class PhoneNumber extends StatelessWidget {
  PhoneNumber({Key? key}) : super(key: key);

  FlCountryCodePicker countryCodePicker = FlCountryCodePicker();

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
            child: Column(children: [
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
                'Enter Phone Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: myHeight / 30,
                    color: R.colors.blackColor,
                    fontFamily: 'worksans',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: myHeight / 50),
              Padding(
                padding:
                    EdgeInsets.only(left: myWidth / 20, right: myWidth / 20),
                child: Text(
                  ' Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: myWidth / 40,
                      color: R.colors.smallTextColor,
                      fontFamily: 'worksans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: myHeight / 50),
              Container(
                height: myHeight / 15,
                width: myWidth / 1.2,
                child: Card(
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(child: Consumer<UserUtils>(
                            builder: (context, utils, child) {
                              return InkWell(
                                onTap: () async {
                                  try {
                                    CountryCode? code = await countryCodePicker
                                        .showPicker(context: context);
                                    if (code != null) {
                                      utils.setCountryCode(
                                          code.dialCode, code.flagImage);
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Container(
                                  height: (myHeight / 11) / 1.4,
                                  width: myWidth / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular((myWidth / 10) / 5)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: (myHeight / 20) / 1.5,
                                        width: (myWidth / 4) / 4,
                                        child: utils.countryFlag == null
                                            ? Image.asset(R.images.UK_FLAG_IMG)
                                            : utils.countryFlag,
                                      ),
                                      Text(
                                        utils.dialCode == null ||
                                                utils.dialCode == ''
                                            ? '+44'
                                            : utils.dialCode!,
                                        style: TextStyle(fontFamily: 'segoe'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ))),
                      Container(height:myHeight/15,width: myWidth/2000,color: Colors.black,),
                      Expanded(
                          flex: 5,
                          child: Container(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: R.colors.themeColor,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: myWidth/100),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: myHeight/30,),
              mainButton(color: R.colors.themeColor,
                  text: 'Send Otp', height: myHeight, width: myWidth, textColor: Colors.white, onTap: (){
                Navigator.pushNamed(context, PagePath.OTP_CODE_PAGE);
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
