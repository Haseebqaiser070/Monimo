import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/Constants/AppColors.dart';
import '../../Utils/Constants/bottomsheetInfo.dart';
import '../../Utils/Constants/reusableProgress.dart';
import 'LeaseholdController.dart';

class Leasehold extends GetView<LeaseholdController>{
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
            padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 5),
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
              reusableProgress(controller.percentage),
              SizedBox(height: 20,),

              Row(
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "Did you know= The ground rent can be fully deducted as income-related expenses every year! It is even permitted to write off lease payments in advance for up to 5 years immediately. If ground rent prepayments are paid for more than 5 years, these can be written off proportionately over the years of the prepayment.");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: mainClr,
                      ),
                      child: Icon(Icons.info,color: Colors.grey,size: 50,),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        openDatePicker(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text("'Date' (When does your leasehold expire?)",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30,),
              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.terminationdates.map((date) => Container(
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
      title: 'Set Termination Date',
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
        controller.terminationdates.add(dateTime);

      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

}