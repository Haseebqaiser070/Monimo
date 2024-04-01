import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/SmokeDetector/SmokeDetectorController.dart';


class SmokeDetector extends GetView<SmokeDetectorController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xff1f5e70), Color(0xff76cce3)],
          ),
        ),
        child: Scaffold(
          appBar:  AppBar(
            backgroundColor: Color(0xffBDFAF0),
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 5),
                child: Image(image: AssetImage('assets/monlmo.png')),
              )
            ],
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mustername+Hessen",
                        style: TextStyle(
                          color:Color(0xffBDFAF0),
                          fontWeight: FontWeight.bold,
                          fontSize: 21
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Text("Rauchmelder Check",
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text("Nächste Wartung",
                        style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("24.04.2024 ",
                            style: Theme.of(context).textTheme.headlineMedium),
                        Text("Änderun",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Wichtige Infomationen",
                        style: TextStyle(
                            color:Color(0xffBDFAF0),
                            fontWeight: FontWeight.bold,
                            fontSize: 21
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text( controller.infoText,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color:Color(0xffBDFAF0),
                        )),
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