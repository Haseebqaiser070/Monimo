import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/DepreciationQuestion/DepreciationQuestionController.dart';
import 'package:flutter/material.dart';
import '../../Utils/Constants/bottomsheetInfo.dart';
import '../../Utils/Constants/AppColors.dart';
import '../../Utils/Constants/reusableProgress.dart';


class DepreciationQuestion extends GetView<DepreciationQuestionController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBDFAF0),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Image(image: AssetImage('assets/monlmo.png')),
        ),
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
                      showInfo(context, "optimizations. The higher your depreciation, from interest and costs, but also building depreciation, the lower the taxable part of your rental income. Only the difference (between depreciation and rental income) has to be taxed according to your individual tax burden. Depreciation is therefore a particularly important part of your asset commitment. Also check whether you can achieve a more optimal tax structure by, for example, modernization measures or the acquisition of another investment property. Talk to a professional about it. By the way: You enter your depreciation amount (AfA) in your tax return under Appendix V Income from renting and leasing in the income-related expenses. Information on questions 1 and 2 (?): You can write off the following costs incurred for your capital property as income-related expenses IMMEDIATELY IN THE SAME YEAR: Real estate advertisements/advertising and brokerage commission (for new rentals), loan interest and account management fees, maintenance or repair costs, travel expenses, ground rent, office costs, insurance*, costs for a lawyer and Accountants, costs for furniture, membership fees for associations, vacancy costs and the costs for this app! Info: The cost of registering the land charge after the notary appointment is also written off immediately! Maintenance or repair costs = maintenance expenses The cost of maintaining or restoring an asset. So maintenance and repair. You can write off these costs immediately or spread over 5 years as income-related expenses. We recommend: The higher your tax burden, the faster you should choose your depreciation. Attention: If you renovate your apartments in several stages and the standard improves significantly within 5 years, these expenses could be counted as production costs. Even if your renovation or modernization costs are higher than 15% (net) of the acquisition costs of your building (WITHOUT land value) within 3 years after purchase, these will be written off at their acquisition costs, i.e. over 40 or 50 years. If you entered your acquisition cost (minus property value), you should see your equivalent amount here: ______( Formula: (acquisition cost - property value)/100x15%) It may be worthwhile for you to wait with some work. A new fitted kitchen, washing machine or fridge is depreciated over 10 years, while a microwave over 8 years. Gardens that tenants use as well as front gardens may also be written off over 10 years. Your photovoltaic system will be depreciated over 20 years. If you rent your apartment(s) furnished, you can also write off the costs of your furniture. Up to 800€ plus VAT per piece of furniture you can write off immediately, beyond that, longer. See also the Afa table of the Federal Ministry of Finance: https://www.bundesfinanzministerium.de/Web/DE/ Thema / Steuern/ Steuerverwaltungu - Steuerrecht/ Betriebsspruefung / AfA_Tablen / afa_tabellen.html You can fully deduct your ground rent every year as income-related expenses! You can even write off ground rent advance payments up to 5 years immediately. In addition, it must be amortized over the period for which it was prepaid. monument protection");
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