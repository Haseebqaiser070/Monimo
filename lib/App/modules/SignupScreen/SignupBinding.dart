import 'package:get/get.dart';
import 'package:monimo/App/modules/SignupScreen/SignupController.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SignupController());
  }
}