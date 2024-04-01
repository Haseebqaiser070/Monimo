import 'package:get/get.dart';

class UserfulLifeQuestionController extends GetxController{


  RxInt percentage = 0.obs;
  Rx<DateTime> q5date = DateTime.now().obs;

  RxList<String> q5_1List = <String>['Yes','No'].obs;
  RxString q5_1Current = "No".obs;
  RxList<String> q5_2List = <String>['Yes','No'].obs;
  RxString q5_2Current = "No".obs;
  RxList<String> q5_2_2List = <String>['Yes','No'].obs;
  RxString q5_2_2Current = "No".obs;
  RxList<String> q6List = <String>['Yes','No'].obs;
  RxString q6Current = "No".obs;
  RxList<String> q7List = <String>['Yes','No'].obs;
  RxString q7Current = "No".obs;
  RxList<String> q7_1List = <String>['Yes','No'].obs;
  RxString q7_1Current = "No".obs;
  RxList<String> q17List = <String>['Yes','No'].obs;
  RxString q17Current = "No".obs;

}