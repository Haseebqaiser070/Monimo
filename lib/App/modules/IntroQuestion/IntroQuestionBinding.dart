import 'package:get/get.dart';
import 'package:monimo/App/modules/IntroQuestion/IntroQuestionController.dart';

class IntroQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencie
    Get.lazyPut(() => IntroQuestionController());
  }
}