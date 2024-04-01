import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TerminationQuestionController extends GetxController{

  TextEditingController nameC = TextEditingController();
  TextEditingController dateC = TextEditingController();
  RxList<DateTime> terminationdates = <DateTime>[].obs;
  RxInt percentage = 0.obs;

}