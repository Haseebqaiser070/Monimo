import 'package:get/get.dart';

class DesignSettingController extends GetxController{


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
}