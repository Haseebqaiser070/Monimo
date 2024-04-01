import 'package:get/get.dart';
import 'package:monimo/App/modules/FinancingQuestion/FinancingQuestionController.dart';

class FinancingQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FinancingQuestionController());
  }
}