import 'package:flutter/material.dart';

Widget mainButton({required Color color,required String text,required double height,required double width,required Color textColor,bool? isIcon,String? icon,required void Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height/15,
      width: width/1.2,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        color: color,
        child: isIcon == true
            ? Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Image.asset(icon!,height: (height/16)/2.5,),
          SizedBox(width: (width/1.2)/30,),
          Center(child: Text(text,style: TextStyle(fontSize: (height/16)/3,fontWeight: FontWeight.w700,fontFamily: 'worksans',color: textColor),),)
        ],)
            : Center(child: Text(text,style: TextStyle(fontSize: (height/16)/3,fontWeight: FontWeight.w700,fontFamily: 'worksans',color: textColor),),),
      )
    ),
  );
}