import 'package:flutter/material.dart';


Card cardButton(String text, String path) {
  return Card(
    color: Color(0xffBDFAF0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "${text}",
          ),
          SizedBox(
            height: 10,
          ),
          Image(width: 70, image: AssetImage('${path}'))
        ],
      ),
    ),
  );
}