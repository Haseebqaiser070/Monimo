import 'package:get/get.dart';
import 'package:monimo/App/modules/IntroScreen/IntroScreenController.dart';

class IntroScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => IntroScreenController());
  }
}