import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../App Routes/Routes.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    handlethemeMode();
    handleRouting();
  }

  String name = "";
  Future handlethemeMode()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    bool isDark = sharedPreferences.getBool('isDark')??false;
    print("Theme mode");
    print(isDark);
    Get.changeThemeMode(isDark?ThemeMode.dark:ThemeMode.light);
  }
  Future handleRouting()async{
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(Routes.IntroScreen);
  }
}