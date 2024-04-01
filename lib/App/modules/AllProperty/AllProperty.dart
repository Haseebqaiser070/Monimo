import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/modules/AllProperty/AllPropertyController.dart';

import '../../Utils/Constants/CardButton.dart';
import '../../Utils/Constants/FooterWidget.dart';


class AllProperty extends GetView<AllPropertyController>{
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
            body: SingleChildScrollView(
              child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("ID 234.343A-Hessen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Image(image: AssetImage('assets/building.png')),
                                        InkWell(
                                          onTap: () => {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //       const singleProperty()),
                                            // )
                                            Get.toNamed(Routes.SingleProperty)
                                          },
                                          child: Container(
                                            width: 100,
                                            decoration:
                                            BoxDecoration(color: Color(0xffBDFAF0)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Center(child: Text("Ansehen")),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Nachste Wartung",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("24.04.2024",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Spekulations- Zeitraum",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("965",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("darlehensende",
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
                                    )
                                  ],
                                ),
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      footor(),
                    ],
                  )),
            ),
          ),
        ));
  }
}