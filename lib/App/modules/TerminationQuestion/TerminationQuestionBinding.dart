import 'package:get/get.dart';
import 'package:monimo/App/modules/TerminationQuestion/TerminationQuestionController.dart';

class TerminationQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TerminationQuestionController());
  }
}