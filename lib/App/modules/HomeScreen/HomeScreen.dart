import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/modules/HomeScreen/HomeScreenController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Utils/Constants/CardButton.dart';
import '../../Utils/Constants/FooterWidget.dart';

class HomeScreen extends GetView<HomeScreenController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xff1d2133), Color(0xff4195af)],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffBDFAF0),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Image(image: AssetImage('assets/monlmo.png')),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.list),
                tooltip: 'Show Snackbar',
                onPressed: () {},
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("Mein Portfolio ",
                              style:
                              Theme.of(context).textTheme.headlineMedium),
                          InkWell(
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const AllProperty()),
                              // )
                              Get.toNamed(Routes.AllProperty)
                            },
                            child: Text("Mehr >",
                                style:
                                Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => {
                        Get.toNamed(Routes.AnlageSingleProperty)
                        // Get.toNamed(Routes.SingleProperty)

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Container(
                                child: Image(
                                    image: AssetImage('assets/building.png')),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text("Eigenkapitalrednite",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  Text("9,65%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Mieteinnahmen",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  Text("€ 20.577,23",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Annuität gesamt ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      Text("€ 14.586,56",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Text("Darlehen gesamt ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      Text("€ 1.512.432,33",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Afa Betrag 2022 gesamt ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Text("€ 210.535,45",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                                minimum: 0, maximum: 40, interval: 10),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ChartSeries<ChartData, String>>[
                              ColumnSeries<ChartData, String>(
                                  dataSource: controller.data,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  name: 'Gold',
                                  color: Color.fromRGBO(8, 142, 255, 1))
                            ]),
                      ),
                    ),

                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: cardButton(
                                  "Versicherungen", "assets/icon1.png"),
                            ),
                            InkWell(
                              child: cardButton(
                                  "Versicherungen", "assets/icon2.png"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: cardButton(
                                  "Versicherungen", "assets/icon3.png"),
                            ),
                            InkWell(
                              child: cardButton(
                                  "Versicherungen", "assets/icon4.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    footor(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

