import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/ExtraCostQuestion/ExtraCostQuestionController.dart';
import '../IntroQuestion/IntroQuestionWidget.dart';

class  ExtraCostQuestion extends GetView<ExtraCostQuestionController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBDFAF0),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 10),
            child: Image(image: AssetImage('assets/monlmo.png')),
          )
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xff1f5e70), Color(0xff76cce3)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nebenkosten",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21
                  ),)
                ],
              ),
              SizedBox(height: 20,),

              dropdownQuestion(controller.currentType, controller.typeLilst),
              SizedBox(height: 10,),

              dropdownQuestion(controller.currentIntallment, controller.installmentList),
              SizedBox(height: 10,),

              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Amount',
                    hintStyle: TextStyle(
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10,),
              dropdownQuestion(controller.contractEndCurrent, controller.contractEndList),
              SizedBox(height: 30,),

              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.costDate.map((date) => Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("${date.day} ${date.month} ${date.year}"),
                  )).toList(),
                ),
              )),
              SizedBox(height: 10,),
              Obx(() =>

              controller.contractEndCurrent.value == "Limited"?
                  InkWell(
                    onTap: (){
                      openDatePicker(context);
                    },
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text("Select Date",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),),
                    ),
                  ):SizedBox(),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Weiter'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set Maintenance Date',
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.blue,
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
        DateTime dateTime = index;
        if(controller.costDate.length == 0){
          controller.costDate.add(dateTime);
        }
        else{
          Fluttertoast.showToast(msg: "Date Already Selected");
        }
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
}