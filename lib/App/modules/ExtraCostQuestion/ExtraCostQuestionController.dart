import 'package:get/get.dart';

class ExtraCostQuestionController extends GetxController{

  RxList<DateTime> costDate = <DateTime>[].obs;

  RxList<String> typeLilst = <String>['Heating Cost','Water Electiricty', 'Property Tax','Other'].obs;
  RxString currentType = "Heating Cost".obs;
  RxList<String> installmentList = <String>['Monthly', 'Quarterly', 'Semi Annually', 'Annually'].obs;
  RxString currentIntallment = "Monthly".obs;
  RxList<String> contractEndList = <String>['Unlimited','Limited'].obs;
  RxString contractEndCurrent = "Unlimited".obs;

}