import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/RootScreen/RootScreenController.dart';


class RootScreen extends GetView<RootScreenController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> controller.pages[controller.index.value]),
      backgroundColor: Colors.white,
      // body: Center(
      //   child: Text("ldkjf"),
      // ),
      bottomNavigationBar: Obx(()=> BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffBDFAF0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/option5.png"),
                width: 24,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: FloatingActionButton.small(
                  child:
                  Image(image: AssetImage("assets/monlmo.png"), width: 25),
                  onPressed: null),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: controller.index.value,
        selectedItemColor: Color(0xFF4DB2A3),
        unselectedItemColor: Color(0xFF4DB2A3),
        onTap: (index){
          controller.index.value = index;
        },
      )),
    );
  }
}