import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/DesignSetting/DesignSettingController.dart';


class DesignSetting extends GetView<DesignSettingController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xff1d2133), Color(0xff4195af)],
          ),
        ),
        child: AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: const Text('Hell/Dunkel-Modus'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Hell/Dunkel-Modus"),
              Obx(() =>  Switch(
                value: controller.NotificationSwitched.value,
                onChanged: controller.toggleNotificationSwitch,
                activeColor: Color(0xFF4DB2A3),
                inactiveTrackColor: Colors.grey,
              ),),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}