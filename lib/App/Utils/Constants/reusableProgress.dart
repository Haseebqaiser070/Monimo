import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


Widget reusableProgress(RxInt percentage) {
  return Obx(() => CircularPercentIndicator(
    radius: 80.0, //radius for circle
    lineWidth: 15.0, //width of circle line
    animation: true, //animate when it shows progress indicator first
    percent: percentage.value / 100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
    backgroundColor: Color.fromARGB(255, 205, 205, 205),
    progressColor: Color(0xff07f5d6),
    animationDuration: 500,
    center: Text(
      "${percentage.value}%",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
  ));
}