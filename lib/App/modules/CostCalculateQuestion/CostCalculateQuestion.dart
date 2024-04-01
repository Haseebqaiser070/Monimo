import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/CostCalculateQuestion/CostCalculateQuestionController.dart';
import 'package:monimo/App/modules/DepreciationQuestion/DepreciationQuestionController.dart';
import 'package:flutter/material.dart';
import '../../Utils/Constants/bottomsheetInfo.dart';
import '../../Utils/Constants/AppColors.dart';
import '../../Utils/Constants/reusableProgress.dart';


class CostCalculateQuestion extends GetView<CostCalculateQuestionController>{
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
              reusableProgress(controller.percentage),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "First of all: Always get proper invoices and avoid cash payments. Info text for question 1: craftsman costs You can deduct up to 20% of your craftsman costs up to €1,200 per year. Attention, material costs are excluded! Always have the labor and material costs shown separately. This only applies to costs that maintain or renovate something, not costs that create something new. Info text for question 2: In addition to manual work, you can also deduct household-related services (not manual but ordinary household tasks that you pass on to third parties) 20% of a maximum of €20,000 (i.e. €4,000) per year. Please contact your accountant or other professional on this matter. Info text for question 3: Depreciation in the case of energy-related refurbishment (applies only without subsidies) Up to 2030 you can get reimbursed for up to 20% of the craftsmen's services (2 years 7% and 1 year 6%) for energy-related renovations (e.g. for new windows or thermal insulation). Prerequisite: Your house must be more than 10 years old, the craftsman invoices should show the labor and material costs separately. For more information, see § 35c EStG. In total, however, it must not amount to more than €40,000 and it does not apply in connection with public funding! Check for yourself whether it might be more worthwhile to take advantage of a subsidy (from the KFW, BAFA, Wohn-Riester). Info text for question 4: Listed properties You can write off 90% of the modernization costs for listed houses or the listed parts of the building that you live in over 10 years. With a WEG, the costs of a monument renovation of common property, and thus the Depreciability, distributed to the co-ownership shares. In the case of monument renovations of the special property or part ownership, only the respective owner is entitled. The monument AfA cannot be transferred to a new buyer! Attention: Before you start your renovation measures, always contact the monument protection authority with your request.");
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
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "Your costs that are immediately written off? (Amount)");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: mainClr,
                      ),
                      child: Icon(Icons.info,color: Colors.grey,size: 50,),
                    ),
                  ),
                  Expanded(child:  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                      'Your costs?',
                    ),
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "Do you have maintenance or repair costs that you want/have to write off over several years? (type, amount, depreciation period) (several entries can be made / Example 1. Type: kitchen, amount: €10,000, depreciation period: 10 years Example 2. Type: bathroom renovation,  amount €5,000, depreciation period 5 years)");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: mainClr,
                      ),
                      child: Icon(Icons.info,color: Colors.grey,size: 50,),
                    ),
                  ),
                  Expanded(child:  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                      'maintenance or repair costs?',
                    ),
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "The costs for your monument protection? (type, amount, year)");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: mainClr,
                      ),
                      child: Icon(Icons.info,color: Colors.grey,size: 50,),
                    ),
                  ),
                  Expanded(child:  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                      'The costs for your monument protection?',
                    ),
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "How high are your purchase or production costs? (excluding the land value*1) (amount)  *1 Calculate property value:");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: mainClr,
                      ),
                      child: Icon(Icons.info,color: Colors.grey,size: 50,),
                    ),
                  ),
                  Expanded(child:  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'How high are your purchase or production costs? (excluding the land value*1) (amount)?',
                    ),
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'How big is your property?',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'How high is your standard land value?',
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

}