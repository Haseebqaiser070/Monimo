import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  List<ChartData> data = [
    ChartData('CHN', 12),
    ChartData('GER', 15),
    ChartData('RUS', 30),
    ChartData('BRZ', 6.4),
    ChartData('IND', 14)
  ];


}


class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}