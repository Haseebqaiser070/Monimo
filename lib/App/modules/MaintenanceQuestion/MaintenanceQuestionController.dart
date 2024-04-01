import 'package:get/get.dart';

class MaintenanceQuestionController extends GetxController{


  RxList<String> typeList = ["Smoke Detector","Heat Sink","Fireplaces", "Electronics","Drinking water","Fire extinguisher","Other"].obs;
  RxString currentTypeValue = "Smoke Detector".obs;
  RxList<DateTime> maintenanceDate = <DateTime>[].obs;
  RxString appointmentTime = "".obs;

}