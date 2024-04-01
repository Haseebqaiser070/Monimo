import 'package:get/get.dart';
import 'package:monimo/App/modules/MaintenanceQuestion/MaintenanceQuestionController.dart';

class MaintenanceQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MaintenanceQuestionController());
  }
}