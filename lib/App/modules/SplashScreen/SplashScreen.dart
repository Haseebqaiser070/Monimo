import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/modules/SplashScreen/SplashScreenController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends GetView<SplashScreenController>{
  @override
  Widget build(BuildContext context) {
    final name = controller.name;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // gradient: LinearGradient(
        //   begin: Alignment.bottomCenter,
        //   end: Alignment.topCenter,
        //   colors: <Color>[Color(0xff1d2133), Color(0xff4195af)],
        // ),
      ),
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/monlmo.png",
            width: 100,
            height: 100,
            color: Colors.black,
          ),
        ),
      ),
    );
  }


}