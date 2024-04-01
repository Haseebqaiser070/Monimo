import 'package:get/get.dart';
import 'package:monimo/App/modules/CostCalculateQuestion/CostCalculateQuestionController.dart';

class CostCalculateQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CostCalculateQuestionController());
  }
}