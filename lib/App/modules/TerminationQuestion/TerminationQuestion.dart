import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/Utils/Constants/AppColors.dart';
import 'package:monimo/App/Utils/Constants/bottomsheetInfo.dart';
import 'package:monimo/App/Utils/Constants/reusableProgress.dart';
import 'package:monimo/App/modules/TerminationQuestion/TerminationQuestionController.dart';

class TerminationQuestion extends GetView<TerminationQuestionController>{
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
                children: [
                  InkWell(
                    onTap: (){
                      showInfo(context, "Cancellations: If you have received a notice from a tenant, you can enter it here, Monimo will then remind you at least 30 days in advance and you can start looking for a new tenant, for example. First of all: The tenant can terminate the contract with a notice period of three months. You must have received the cancellation by the third working day at the latest... this is just a reminder. Here are our tips for new rentals: - Pay attention to the rent index in your region: Zip code rent index - There may be a rental price brake* in your region (applies to you Rent control, the net rent may only be 10% above the comparative value for a new rental. For this, look at the rent index for your region.) Rent brake: *The rental price brake only applies if the property was re-let after the law came into force (depending on the federal state). For new buildings after September 2014 there is no rent control. Previous rents (for residential purposes) that already showed an excessive rent before the rent brake came into force may be continued at this level and demanded. If your modernization measures before the new rental are so comprehensive that approx. a third of the effort for a new apartment or the status of a new building is reached, the rental price brake also does not apply. If you rent a furnished apartment, approx. 2% of the purchase costs of the furniture can be allocated to the rent. However, the rental price brake still applies. Temporary rental contract: If you rent a furnished apartment for a limited period of time (temporary rental contract up to 12 months), there is no rent cap! By the way: Recommend your tenants to take out private liability insurance and contents insurance. We recommend the following documents for the rental applicant to be checked: - Tenant self-assessment (even if this is not mandatory as a tenant applicant) - Copy of identity card or passport - The last three pay slips or other proof of income (Our recommendation: the rent should not be more than 1/3 of the total income) - A Schufa information - Certificate of prior landlord (not mandatory) To the rental agreement: - It is best to use current form rental contracts. - All future adult residents of the apartment should be named in the rental agreement with their full name, previous registered address and date of birth and sign them personally. - When handing over the apartment, the rental deposit and the first rent payment should be submitted be received by you as a landlord. - Rental scales are allowed, but you must not violate the rental price brake. - Index rents rise or fall parallel to the published consumer price index (the Destatis calculator can be useful for calculating the changes : https://www.destatis.de/DE/Themen/Wirtschaft/ Prices/Verwachsenerpreisindex/Methods/ Internetprogramm.html ) For handing over the apartment: - Document the handover of the apartment (preferably with photos) for the current condition and note the current meter readings for electricity, gas and water. landlord confirmation If your new tenants need a confirmation from the landlord to prove to the Citizens’ Registration Office, you must hand it overwithin the first two weeks after moving in. If you prefer to hire a broker for the new rental, you can of course deduct the costs for this! Option: If you have a commercial tenant where the tenant has the option to extend the tenancy, you can set the decision date here. If you do not want to continue the tenancy, you can start looking for a new tenant.");
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
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Tenant (name)',
                          hintStyle: TextStyle(
                              fontSize: 14
                          )
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
                  child: Text("Date (terminated on / deadline for exercising the option right)",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),),
                ),
              ),
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