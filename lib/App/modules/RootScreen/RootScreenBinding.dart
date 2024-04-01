import 'package:get/get.dart';
import 'package:monimo/App/modules/DesignSetting/DesignSettingController.dart';
import 'package:monimo/App/modules/FinancingQuestion/FinancingQuestionController.dart';
import 'package:monimo/App/modules/HomeScreen/HomeScreenController.dart';
import 'package:monimo/App/modules/Insurance/InsuranceController.dart';
import 'package:monimo/App/modules/IntroQuestion/IntroQuestionController.dart';
import 'package:monimo/App/modules/Profile/ProfileController.dart';
import 'package:monimo/App/modules/RootScreen/RootScreenController.dart';
import 'package:monimo/App/modules/UserfulLifeQuestion/UserfulLifeQuestionController.dart';

class RootScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RootScreenController());
    Get.lazyPut(() => UserfulLifeQuestionController());
    Get.lazyPut(() => InsuranceController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => FinancingQuestionController());
    Get.lazyPut(() => ProfileController());

    Get.lazyPut(() => DesignSettingController());
    Get.lazyPut(() => IntroQuestionController());

  }
}