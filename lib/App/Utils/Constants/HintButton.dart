
import 'package:flutter/material.dart';
Widget HintButton(Function fnc){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    height: 55,
    width: 40,
    decoration: BoxDecoration(
      color: Color(0xff1f5e70)
    ),
    alignment: Alignment.center,
    child: Icon(Icons.report_gmailerrorred_rounded,color: Color(0xff76cce3),size: 40,),
  );
}