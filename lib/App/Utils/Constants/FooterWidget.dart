import 'package:flutter/material.dart';

Container footor() {
  return Container(
    color: Color(0xffBDFAF0),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Adresse"),
              Text("Koloneus 9"),
              Text("12211 "),
              Text("Hamburg"),
            ],
          ),
          Column(
            children: [
              Text("Impressum"),
              Text("Help"),
              Text("Über uns"),
              Text("Datenschutz"),
            ],
          ),
        ],
      ),
    ),
  );
}