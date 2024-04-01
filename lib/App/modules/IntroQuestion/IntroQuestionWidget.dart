

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dropdownQuestion(RxString currentValue, RxList<String> itemList){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Color(0xff76cce3),
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child:
    Obx(()=> DropdownButton(
      value: currentValue.value,
      icon: Icon(Icons.arrow_drop_down),
      underline: SizedBox(),
      isExpanded: true,
      items: itemList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (v){
        currentValue.value = v!;
      },

    )),
  );
}


Widget StatementQuestion(String question,Function()? fnc){
  return  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Expanded(
        child: Text(question,style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      SizedBox(width: 6,),
      InkWell(
        onTap: fnc,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff76cce3),
          ),
          child: Icon(Icons.question_mark_outlined,size: 15,),
        ),
      ),
    ],
  );
}
