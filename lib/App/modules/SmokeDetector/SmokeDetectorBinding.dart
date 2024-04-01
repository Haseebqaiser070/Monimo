import 'package:get/get.dart';
import 'package:monimo/App/modules/SmokeDetector/SmokeDetectorController.dart';

class SmokeDetectorBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SmokeDetectorController());
  }
}