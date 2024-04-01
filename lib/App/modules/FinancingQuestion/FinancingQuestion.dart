import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/FinancingQuestion/FinancingQuestionController.dart';

import '../../Utils/Constants/AppColors.dart';
import '../../Utils/Constants/bottomsheetInfo.dart';

class FinancingQuestion extends GetView<FinancingQuestionController>{
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "There are usually significant benefits to holding investment property with little equity and more leverage. On the one hand, you increase the return on equity (see also leverage effect), have more liquid funds for further investments or security and, something that is often overlooked, the borrowed capital is tax-free! What does that mean? Here is a simplified example to illustrate: investment 1 Equity: €100,000 (from taxed equity) Purchase of an apartment Rent approx. 4,000 € pa = 4% yield in the first year investment 2 Equity: €100,000 (from taxed equity) Buys 5 identical apartments at approx. 4,000 € rent pa So 20,000 € rent pa Interest on the borrowed money (€400,000*/100 x 2% (interest) = €8,000 pa – €20,000 rent pa= €12,000 or 12% return in the first year. *This amount corresponds to a value of up to approx. €730,000 before taxes and “works” or generates income for you from now on");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: mainClr,
                      ),
                      child: Icon(Icons.info,color: Colors.grey,size: 50,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Did you make special payments?',
                    hintStyle: TextStyle(
                        fontSize: 14
                    )
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 30,),
              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.financingDate.map((date) => Container(
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
        if(controller.financingDate.length == 0){
          controller.financingDate.add(dateTime);
        }
        else{
          Fluttertoast.showToast(msg: "Date Already Selected");
        }
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

}