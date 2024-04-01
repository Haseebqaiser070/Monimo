import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:monimo/App/Services/CurrentUserData.dart';
import 'package:monimo/App/models/UserData.dart';

import '../../Providers/FirebaseProvider.dart';

class ProfileController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _firebaseProvider = Get.find();
    getUser();
  }

  String name = "lkdf";

  late FirebaseProvider _firebaseProvider;
  Rx<UserData> userData = UserData().obs;

  Future getUser()async{
    userData.value = await _firebaseProvider.getUserData();
      print("ldkfj");
      print(userData.value.name);
  }




  RxBool NotificationSwitched = false.obs;
  RxString textValue = 'Switch is OFF'.obs;
  void toggleNotificationSwitch(bool value) {
    if (NotificationSwitched.value == false) {
        NotificationSwitched.value = true;
        textValue.value = 'Switch Button is ON';
      print('Switch Button is ON');
    } else {
        NotificationSwitched.value = false;
        textValue.value = 'Switch Button is OFF';
      print('Switch Button is OFF');
    }
  }

  RxBool TouchIDSwitched = false.obs;

  void toggleTouchidSwitch(bool value) {
    if (TouchIDSwitched.value == false) {
        TouchIDSwitched.value = true;
        textValue.value = 'Switch Button is ON';
      print('Switch Button is ON');
    } else {
        TouchIDSwitched.value = false;
        textValue.value = 'Switch Button is OFF';
      print('Switch Button is OFF');
    }
  }

  RxBool FaceIDSwitched = false.obs;

  void toggleFaceidSwitch(bool value) {
    if (FaceIDSwitched.value == false) {
        FaceIDSwitched.value = true;
        textValue.value = 'Switch Button is ON';
      print('Switch Button is ON');
    } else {
        FaceIDSwitched.value = false;
        textValue.value = 'Switch Button is OFF';
      print('Switch Button is OFF');
    }
  }


  logout(){
    _firebaseProvider.logout();

  }

}