import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:monimo/App/Providers/FirebaseProvider.dart';

import '../../App Routes/Routes.dart';


class SignupController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firebaseProvider = Get.find();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }
  late FirebaseProvider firebaseProvider;
  final keyForm = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  RxBool isLoading = false.obs;

  //Sign up Fun
  Future signup()async{
    if(keyForm.currentState!.validate()){
      isLoading.value =true;
      bool result = await firebaseProvider.passwordSignup(nameC.text,emailC.text, passC.text);
      isLoading.value =false;
      if(result){
        Get.offAllNamed(Routes.RootScreen,arguments: 0);
      }
      else{
        Fluttertoast.showToast(msg: "Cannot Sign up!");
      }
    }
  }
}