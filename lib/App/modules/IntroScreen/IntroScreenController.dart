
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../App Routes/Routes.dart';
import '../../Providers/FirebaseProvider.dart';

class IntroScreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firebaseProvider = Get.find();
  }


  late FirebaseProvider firebaseProvider;
  final keyForm = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isLoadingGoogle = false.obs;
  RxBool isLoadingApple = false.obs;


  //Sign in Fun
  Future signin()async{
    if(keyForm.currentState!.validate() && !isLoading.value){
      isLoading.value =true;
      bool result = await firebaseProvider.passwordSignin(emailC.text, passC.text);
      isLoading.value =false;
      if(result){
        Get.offAllNamed(Routes.RootScreen,arguments: 0);
      }
      else{
        Fluttertoast.showToast(msg: "Email or password is wrong.");
      }
    }
  }


  Future googleSignin()async{
    isLoadingGoogle.value = true;
    bool result = await firebaseProvider.googleSignin();

    if(result){
      isLoadingGoogle.value = false;
      Get.offAllNamed(Routes.RootScreen,arguments: 0);
    }
    else{
      isLoadingGoogle.value = false;
      Fluttertoast.showToast(msg: "Couldn't Login!");
    }
  }


  Future appleSignin()async{
    isLoadingApple.value = true;
    bool result = await firebaseProvider.appleSignin();

    if(result){
      isLoadingApple.value = false;
      // Get.offAllNamed(Routes.RootScreen,arguments: 0);
    }
    else{
      isLoadingApple.value = false;
      Fluttertoast.showToast(msg: "Couldn't Login!");
    }
  }
}