import 'package:doctor_app/Resources/fetch_pixel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/MainButton.dart';
import '../Resources/R.dart';
import '../Routes/RoutesPath.dart';
import '../ViewModel/UserUtils.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

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
                  SizedBox(height: myHeight/40),
                  Text('Sign Up',style: TextStyle(fontSize: myHeight/30,color: R.colors.blackColor,fontFamily: 'worksans',fontWeight: FontWeight.bold),),
                  SizedBox(height: myHeight/50),
                  Padding(
                    padding: EdgeInsets.only(left: myWidth/20,right: myWidth/20),
                    child: Text(' Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: myWidth/40,color: R.colors.smallTextColor,fontFamily: 'worksans',fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: myWidth/20),
                  Container(height: myHeight/3.3,width: myWidth,
                    child: Image.asset(R.images.SIGNUP_IMG),),
                  SizedBox(height: myHeight/20),
                  mainButton(color: R.colors.themeColor,text: 'Sign Up With Phone Number',height: myHeight,width: myWidth,textColor: Colors.white,onTap: (){
                    UserUtils utils = Provider.of(context,listen: false);
                    utils.isSignin = false;
                    Navigator.pushNamed(context, PagePath.PHONE_NUMBER_PAGE);
                  }),
                  SizedBox(height: myHeight/30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: myHeight/5000,width: myWidth/2.5,color: Colors.black,margin: EdgeInsets.only(left: myWidth/50,right: myWidth/50),),
                      Text('or',style: TextStyle(fontFamily: 'worksans',fontSize: myHeight/50,color: R.colors.blackColor),),
                      Container(height: myHeight/5000,width: myWidth/2.5,color: Colors.black,margin: EdgeInsets.only(left: myWidth/50,right: myWidth/50),),
                    ],
                  ),
                  SizedBox(height: myHeight/30),
                  mainButton(color: R.colors.blueColor,text: 'Sign In With Facebook',height: myHeight,width: myWidth,textColor: Colors.white,isIcon: true,icon: R.images.FB_IMG,onTap: (){}),
                  SizedBox(height: myHeight/40),
                  mainButton(color: Colors.white,text: 'Sign In With Google',height: myHeight,width: myWidth,textColor: Colors.black,isIcon: true,icon: R.images.GOOGLE_IMG,onTap: (){}),
                  SizedBox(height: myHeight/40),
                  mainButton(color: R.colors.blackColor,text: 'Sign In With Apple',height: myHeight,width: myWidth,textColor: Colors.white,isIcon: true,icon: R.images.APPLE_IMG,onTap: (){}),
                  SizedBox(height: myHeight/27),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?',style: TextStyle(color: Colors.black,fontSize: myHeight/60,fontFamily: 'worksans'),),
                      InkWell(
                          onTap: (){
                            UserUtils utils = Provider.of(context,listen: false);
                            utils.isSignin = true;
                            Navigator.pushNamed(context, PagePath.SIGNIN_PAGE);
                          },
                          child: Text(' Sign In Here',style: TextStyle(color: R.colors.themeColor,fontWeight: FontWeight.w700,fontSize: myHeight/60,fontFamily: 'worksans'),))
                    ],
                  ),
                  SizedBox(height: myHeight/70),
                ],
              ),
            ),
          ),
        ));
  }
}
