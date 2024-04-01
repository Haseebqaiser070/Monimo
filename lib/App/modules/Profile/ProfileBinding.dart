import 'package:get/get.dart';
import 'package:monimo/App/modules/Profile/ProfileController.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProfileController());
  }
}