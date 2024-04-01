import 'package:get/get.dart';
import 'package:monimo/App/modules/DepreciationQuestion/DepreciationQuestionController.dart';

class DepreciationQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DepreciationQuestionController());
  }
}