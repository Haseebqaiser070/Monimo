import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/modules/Profile/ProfileController.dart';


class Profile extends GetView<ProfileController>{
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
            body: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: CircleAvatar(
                          radius: 48, // Image radius
                          backgroundImage: AssetImage('assets/user.jpg'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Profilbearbeiten'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Persönliche Angaben",
                            style: TextStyle(
                                color: Color(0xffbdfaf0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name ",
                                    style: TextStyle(color: Color(0xff5db9ab)),
                                  ),
                                  Obx(() => Text(controller.userData.value.name??"",
                                    style: TextStyle(color: Color(0xff5db9ab)),
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Emailadresse",
                                    style: TextStyle(color: Color(0xff5db9ab)),

                                  ),
                                  Obx(() => Text(controller.userData.value.email??"",
                                    style: TextStyle(color: Color(0xff5db9ab)),
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Adresse",
                                    style: TextStyle(color: Color(0xff5db9ab)),
                                  ),
                                  Text("D-370, North Carolina ",
                                    style: TextStyle(color: Color(0xff5db9ab)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Geburtstag",
                                    style: TextStyle(color: Color(0xff5db9ab)),
                                  ),
                                  Text("16/04/2000",
                                    style: TextStyle(color: Color(0xff5db9ab)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sicherheit",
                            style: TextStyle(
                                color: Color(0xffbdfaf0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Passwort ändern",
                                    style: TextStyle(color: Color(0xFF4DB2A3)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Passwort ändern",
                                      style: TextStyle(
                                        color: Color(0xFF4DB2A3),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // "Face-ID",
                                    controller.name,
                                    style: TextStyle(color: Color(0xFF4DB2A3)),
                                  ),
                                  Obx(() =>  Switch(
                                    value: controller.FaceIDSwitched.value,
                                    onChanged: controller.toggleFaceidSwitch,
                                    activeColor: Color(0xFF4DB2A3),
                                    inactiveTrackColor: Colors.grey,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,

                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Touch-ID",
                                    style: TextStyle(color: Color(0xFF4DB2A3)),
                                  ),
                                  Obx(() => Switch(
                                    value: controller.TouchIDSwitched.value,
                                    onChanged: controller.toggleTouchidSwitch,
                                    activeColor: Color(0xFF4DB2A3),
                                    inactiveTrackColor: Colors.grey,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Benachrichtigungseinst",
                            style: TextStyle(
                                color: Color(0xffbdfaf0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Benachrichtigungseinst",
                                    style: TextStyle(color: Color(0xFF4DB2A3)),
                                  ),
                                  Obx(() =>  Switch(
                                    value: controller.NotificationSwitched.value,
                                    onChanged: controller.toggleNotificationSwitch,
                                    activeColor: Color(0xFF4DB2A3),
                                    inactiveTrackColor: Colors.grey,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 45),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Datenschutzeinst",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF4DB2A3)),
                              ),
                              InkWell(
                                onTap: () => {
                                  controller.logout()
                                },
                                child: Text(
                                  "Log out",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xFF4DB2A3)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}