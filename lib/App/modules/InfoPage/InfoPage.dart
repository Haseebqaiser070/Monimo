import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monimo/App/modules/InfoPage/InfoPageController.dart';

class InfoPage extends GetView<InfoPageController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xff16a5c9),Color(0xff1f5e70)],
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
                    SizedBox(
                      height: 30,
                    ),
                    Text( controller.infoText,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color:Color(0xffBDFAF0),
                              fontSize: 16
                          ),
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