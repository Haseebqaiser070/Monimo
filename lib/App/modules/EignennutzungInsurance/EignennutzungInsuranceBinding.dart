import 'package:get/get.dart';
import 'package:monimo/App/modules/EignennutzungInsurance/EignennutzungInsuranceController.dart';

class EignennutzungInsuranceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => EignennutzungInsuranceController());
  }
}