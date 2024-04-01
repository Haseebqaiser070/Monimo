import 'package:get/get.dart';
import 'package:monimo/App/modules/DesignSetting/DesignSettingController.dart';

class DesignSettingBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DesignSettingController());
  }
}