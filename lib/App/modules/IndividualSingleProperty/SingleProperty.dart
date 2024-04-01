import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/modules/IndividualSingleProperty/SinglePropertyController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Utils/Constants/FooterWidget.dart';



class SingleProperty extends GetView<SinglePropertyController>{
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
            leading: IconButton(
              onPressed: (){
                Get.offAllNamed(Routes.RootScreen,arguments: 0);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 10),
                child: Image(image: AssetImage('assets/monlmo.png')),
              )
            ],
          ),

          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text("Mustername + Hessen",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: ()async{
                                        XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                        if(image != null){
                                          File imgfile = File(image.path);
                                          print(imgfile.path);
                                        }
                                      },
                                      child: Image(
                                          image:
                                          AssetImage('assets/building.png')),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 120,
                                      height: 120,
                                      child: SfCartesianChart(
                                          primaryXAxis: CategoryAxis(),
                                          primaryYAxis: NumericAxis(
                                              minimum: 0,
                                              maximum: 40,
                                              interval: 10),
                                          tooltipBehavior: TooltipBehavior(enable: true),
                                          series: <
                                              ChartSeries<ChartData, String>>[
                                            ColumnSeries<ChartData, String>(
                                                dataSource: controller.data,
                                                xValueMapper:
                                                    (ChartData data, _) =>
                                                data.x,
                                                yValueMapper:
                                                    (ChartData data, _) =>
                                                data.y,
                                                name: 'Gold',
                                                color: Color.fromRGBO(
                                                    8, 142, 255, 1))
                                          ]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Get.toNamed(Routes.ExtraCostQuestion);
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Nebenkosten",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("9,65%",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      InkWell(
                                        onTap: () => {
                                          Get.toNamed(Routes.MaintenanceQuestion)
                                        },
                                        child: Text("Nachste Wartung",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                      ),
                                      Text("24.04.2024",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Get.toNamed(Routes.SmokeDetector, arguments: "Here you can find out when you would no longer have to pay taxes on your profit after selling a property! The prerequisite for this is that you have lived in the property yourself for “3 years”. The period for rented real estate is 10 years. As you may have noticed, it is not actually 3 years, but a full calendar year after moving in. So: move-in year + following full calendar year Please also check before a possible sale whether you might have to pay a “prepayment penalty” to your bank. If you received the property as a gift or inheritance, the date on which the original purchase contract was signed still applies.");
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Spekulations- Zeitraum",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("965",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Get.toNamed(Routes.FinancingQuestion);
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Darlehensende",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("31.04.2032",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("Restdarlehen",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("€ 732.334,34",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("Theoretische Abzahlung",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("€ 732.334,34",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Icon(Icons.file_open,color: Colors.blueAccent,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(Routes.FinancingQuestion);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Zinsen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("1,8%",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffB1B1B1), //color of divider
                                      width: 30, //width space of divider
                                      thickness: 1.5, //thickness of divier line
                                    ),
                                    Column(
                                      children: [
                                        Text("Annualität",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("€ 7.345,20",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffB1B1B1), //color of divider
                                      width: 30, //width space of divider
                                      thickness: 1.5, //thickness of divier line
                                    ),
                                    Column(
                                      children: [
                                        Text("Tilgung",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("2,2%",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(Routes.FinancingQuestion);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Darlehensende",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("31.04.2032",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffB1B1B1), //color of divider
                                      width: 30, //width space of divider
                                      thickness: 1.5, //thickness of divier line
                                    ),
                                    Column(
                                      children: [
                                        Text("Restdarlehen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("€ 730.334,34",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                  options(),
                  SizedBox(
                    height: 20,
                  ),
                  footor(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget options() {
    return Container(
      color: Color(0xff1a2a39),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ListTile(
              onTap: (){
                Get.toNamed(Routes.CostCalculateQuestion);
              },
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option1.png"),
              ),
              title: Text('Abschreibungen'),
              subtitle: Text('(inkl. Denkmalschutz, Erbpacht'),
            ),

            InkWell(
              onTap: () => {
                Get.toNamed(Routes.EignennutzungInsurance)
              },
              child: ListTile(
                textColor: Color(0xff5db9ab),
                leading: Image(
                  image: AssetImage("assets/option5.png"),
                ),
                title: Text('Versicherungen'),
              ),
            ),
            InkWell(
              onTap: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const IntroQuestions()),
                // )
              Get.toNamed(Routes.IntroQuestion)
            },
              child: ListTile(
                textColor: Color(0xff5db9ab),
                leading: Image(
                  image: AssetImage("assets/option6.png"),
                ),
                title: Text('Weitere Immobilien Eingeben'),
              ),
            ),
            ListTile(
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option7.png"),
              ),
              title: Text('Night Mode'),
              trailing: Obx(() =>  Switch(
                value: controller.nighmodeValue.value,
                onChanged: controller.toggleModeSwitch,
                activeColor: Color(0xFF4DB2A3),
                inactiveTrackColor: Colors.grey,
              ),),
            ),
            InkWell(
              onTap: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const IntroScreen()),
                // )
              Get.offAllNamed(Routes.IntroScreen)
            },
              child: ListTile(
                textColor: Color(0xff5db9ab),
                leading: Image(
                  image: AssetImage("assets/option8.png"),
                ),
                title: Text('Anmelden/Abmelden'),
              ),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(Routes.InfoPage,arguments: "This app does not constitute tax or legal advice. Please have your individual personal situation clarified by a lawyer and/or tax advisor. Other errors may have crept into the app, please check all information with a professional.");

              },
              textColor: Color(0xff5db9ab),
              title: Text("Imprint / Diclaimer"),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(Routes.InfoPage,arguments: "Did you notice any mistakes? If you have any questions or would like to share more real estate tips, please send us a message! We look forward to checking every message that reaches us.");
              },
              textColor: Color(0xff5db9ab),
              title: Text("Help / Questions"),
            ),
          ],
        ),
      ),
    );
  }

}