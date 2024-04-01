import 'package:get/get.dart';
import 'package:monimo/App/modules/ExtraCostQuestion/ExtraCostQuestionController.dart';

class ExtraCostQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ExtraCostQuestionController());
  }
}