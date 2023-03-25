import 'package:doctor_app/Components/CustomTextField.dart';
import 'package:doctor_app/Components/MainButton.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Resources/R.dart';
import '../ViewModel/UserUtils.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  FlCountryCodePicker countryCodePicker = FlCountryCodePicker();

  @override
  Widget build(BuildContext context) {
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
                      'Sign Up',
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
                  'User Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: myHeight / 30,
                      color: R.colors.blackColor,
                      fontFamily: 'worksans',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: myHeight/50),
                Padding(
                  padding: EdgeInsets.only(left: myWidth/20,right: myWidth/20),
                  child: Text(' Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: myWidth/40,color: R.colors.smallTextColor,fontFamily: 'worksans',fontWeight: FontWeight.bold),),
                ),
                customTextFormField(myWidth: myWidth/1.2, label: 'Name',hintText: 'Input Name',controller: nameController,onTap: (){},onChange: (value){}),
                SizedBox(height: myHeight/50),
                Container(
                  width: myWidth/1.2,
                  child: Text('Phone Number',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'worksans'),),
                ),
                Container(
                  height: myHeight / 13,
                  width: myWidth / 1.2,
                  child: Card(
                    elevation: 2,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                                child: Consumer<UserUtils>(
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
                                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: myHeight/50),
                customTextFormField(myWidth: myWidth/1.2, label: 'City',hintText: 'Input City',controller: cityController,onTap: (){},onChange: (value){}),
                SizedBox(height: myHeight/50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customTextFormField(myWidth: (myWidth/1.2)/2, label: 'Age',hintText: 'Input age',controller: ageController,onTap: (){},onChange: (value){}),
                      customTextFormField(myWidth: (myWidth/1.2)/2, label: 'Sex',hintText: 'Select Gender',controller: sexController,onTap: (){},onChange: (value){}),
                    ],
                  ),
                SizedBox(height: myHeight/50),
                mainButton(color: R.colors.themeColor, text: 'Continue', height: myHeight, width: myWidth, textColor: Colors.white, onTap: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
