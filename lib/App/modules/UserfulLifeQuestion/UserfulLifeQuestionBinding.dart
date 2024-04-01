import 'package:get/get.dart';
import 'package:monimo/App/modules/UserfulLifeQuestion/UserfulLifeQuestionController.dart';

class UserfulLifeQuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UserfulLifeQuestionController());
  }
}