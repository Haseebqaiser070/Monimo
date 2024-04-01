import 'package:get/get.dart';
import 'package:monimo/App/modules/UpdateData/UpdateDataController.dart';

class UpdateDataBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpdateDataController());
  }
}