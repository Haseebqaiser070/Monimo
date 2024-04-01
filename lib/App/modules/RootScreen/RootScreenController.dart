import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:monimo/App/modules/FinancingQuestion/FinancingQuestion.dart';
import 'package:monimo/App/modules/HomeScreen/HomeScreen.dart';
import 'package:monimo/App/modules/Insurance/Insurance.dart';
import 'package:monimo/App/modules/IntroQuestion/IntroQuestion.dart';
import 'package:monimo/App/modules/Profile/Profile.dart';
import 'package:monimo/App/modules/UserfulLifeQuestion/UserfulLifeQuestion.dart';

import '../DesignSetting/DesignSetting.dart';


class RootScreenController extends GetxController{

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    index.value = Get.arguments;
  }

  RxInt index = 0.obs;



  RxList<Widget> pages = [
    // UsefulLifeQuestion(),
    IntroQuestion(),
    Insurance(),
    HomeScreen(),
    // FinancingQuestion(),
    DesignSetting(),
    Profile(),
  ].obs;
}