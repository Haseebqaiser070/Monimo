
import 'package:flutter/material.dart';
 import 'package:get/get.dart';

showInfo(BuildContext context, String txt){
  return showModalBottomSheet(context: context,
      shape:  RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context){
        return Container(
          width: Get.width,
          height: 700,
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.close)),
                  ],
                ),
                Text(txt,textAlign: TextAlign.justify,)
              ],
            ),
          ),
        );
      });
}