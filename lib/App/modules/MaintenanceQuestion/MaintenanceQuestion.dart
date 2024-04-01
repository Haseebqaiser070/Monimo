import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/MaintenanceQuestion/MaintenanceQuestionController.dart';
import '../../Utils/Constants/AppColors.dart';
import '../../Utils/Constants/bottomsheetInfo.dart';
import '../IntroQuestion/IntroQuestionWidget.dart';


class MaintenanceQuestion extends GetView<MaintenanceQuestionController>{
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
                      showInfo(context, "-Smoke detector: Your smoke detectors must be checked for functionality once a year. Theoretically it is possible to transfer the testing and installation of the smoke detectors to your tenants if your tenant has agreed to do so. However, since you are still liable as the owner, we expressly do not recommend this procedure. Instead, you should rather have the installation carried out by a company and the maintenance carried out by a caretaker or an external company (costs no more than €5 per detector and can be passed on to the tenant as other operating costs via § 2 No. 17 Operating Costs Ordinance if this was agreed in the rental agreement). By the way: The installation costs for the smoke detectors can be passed on to the tenants by means of a modernization rent increase. More precisely: 8% of the assembly costs can be passed on as a rent increase. 'Rental Smoke Meder' Whether the costs for so-called 'rental smoke detectors' can be passed on to the tenant as ancillary costs has not yet been determined. In which rooms do they have to be installed? Smoke alarms must be installed in bedrooms and children's rooms as well as in corridors that serve as escape routes. In some federal states, these must also be installed in living rooms. Where do these have to be attached? Smoke detectors must be attached horizontally/centrally to the ceiling. For rooms larger than 60 square meters or if a room has beams, several must be attached. With a roof pitch of more than 20 degrees, the smoke detectors must be installed at a distance of at least half a meter and at most one meter from the top of the ceiling. If there is a horizontal part that is wider than 1 meter, it can be installed there. - heating system Heating systems should be serviced regularly (often once a year). Cleaning and optimizing the heater leads to lower heating costs and, if wear parts are replaced in good time, often to a longer service life. Underground oil tank systems are generally to be checked every 5 years, in water protection areas every 2.5 years. Ask the maintenance company for the perfect inspection interval for your heating system. - fireplaces As the owner, you must register fireplaces. Have the obligation to sweep and inspect your systems checked by a chimney sweep. Talk to your chimney sweep about how often he has to come to you. -Electronics Since 1997 homeowners have been obliged to have their electrical systems checked. An e-check should be carried out every 4 years. - Drinking water For landlords, a legionella test is mandatory for at least every 3 years, possibly more frequently - please check this for your property. - Fire extinguisher If you have fire extinguishers in your house, they should be checked by a specialist at least every 2 years. - Various We also recommend checking the following work: - To remove dirt from gutters and water drains - Clean house water filter - Keep shut-off taps running (if they are not moved for a long time, they can get stuck; we recommend closing them once and opening them again) - Check window seals - Clean the sieves of washing machines and dishwashers if you have access to them (shared laundry room etc.) - PS: The intervals at which the measures for the renewal of, for example: gutters, roofing, external stairs, windows or front doors, bathroom and kitchen fittings etc. should take place depends not least on the quality, care and durability of the products or materials used. Here we recommend at least a regular visual inspection.");
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
              dropdownQuestion(controller.currentTypeValue,controller.typeList),
              SizedBox(height: 10,),
              SizedBox(height: 30,),
              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.maintenanceDate.map((date) => Container(
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
              Obx(() => controller.currentTypeValue.value == "Other"?
                TextField(
                decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'How high is your standard land value?',
              )):SizedBox(),
              ),
              SizedBox(height: 10,),
              Obx(() =>
              controller.appointmentTime.value == "" ? SizedBox() :
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.maintenanceDate.map((date) => Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(controller.appointmentTime.value),
                )).toList(),
              )),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      accentColor: Colors.blueAccent,
                      value: Time(hour: 0, minute: 0),
                      sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                      sunset: TimeOfDay(hour: 18, minute: 0), // optional
                      duskSpanInMinutes: 120, // optional
                      onChange: (v){
                        print(v.hour);
                        print(v.minute);
                        print(v.second);
                        controller.appointmentTime.value = "${v.hour} ${v.minute}";

                        print(controller.appointmentTime.value);
                      },
                    ),
                  );
                },
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text("Select Appointment Time",style: TextStyle(
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
        if(controller.maintenanceDate.length == 0){
          controller.maintenanceDate.add(dateTime);
        }
        else{
          Fluttertoast.showToast(msg: "Date Already Selected");
        }
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

}