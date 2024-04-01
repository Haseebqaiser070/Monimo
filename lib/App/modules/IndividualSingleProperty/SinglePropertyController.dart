import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SinglePropertyController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    handleThemeMode();
  }


  late SharedPreferences sharedPreferences;


  List<ChartData> data = [
   ChartData('CHN', 12),
   ChartData('GER', 15),
   ChartData('RUS', 30),
   ChartData('BRZ', 6.4),
   ChartData('IND', 14)
 ];


  handleThemeMode()async{
    sharedPreferences = await SharedPreferences.getInstance();
    nighmodeValue.value = sharedPreferences.getBool('isDark')??false;
  }



 RxBool nighmodeValue = false.obs;
 RxString textValue = 'Switch is OFF'.obs;



 void toggleModeSwitch(bool value) async{
   sharedPreferences = await SharedPreferences.getInstance();
   if (nighmodeValue.value == false) {
     nighmodeValue.value = true;
     textValue.value = 'Switch Button is ON';
     print('Switch Button is ON');
     sharedPreferences.setBool('isDark', true);
     Get.changeThemeMode(ThemeMode.dark);

   } else {
     nighmodeValue.value = false;
     textValue.value = 'Switch Button is OFF';
     print('Switch Button is OFF');
     sharedPreferences.setBool('isDark', false);
     Get.changeThemeMode(ThemeMode.light);
   }
 }


}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}