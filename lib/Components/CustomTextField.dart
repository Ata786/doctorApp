import 'package:flutter/material.dart';
import '../Resources/R.dart';

Widget customTextFormField(
{
  void Function()? onTap,
  void Function(String)? onChange,
  required double myWidth,
  required String label,
  bool? obsecureText,
  required String hintText,
  required TextEditingController controller,
}
    ){
  return Container(
    width: myWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontFamily: 'worksans'),),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: R.colors.themeColor,
            obscureText: obsecureText == null ? false : obsecureText,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.only(left: (myWidth/1.2)/20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: InputBorder.none,
            ),
            onTap: onTap,
            onChanged: onChange,
          ),
        )
      ],
    ),
  );
}