import 'package:get/get.dart';
import 'package:monimo/App/modules/SplashScreen/SplashScreenController.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashScreenController());
  }
}