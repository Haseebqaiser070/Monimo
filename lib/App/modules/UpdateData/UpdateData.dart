import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/modules/UpdateData/UpdateDataController.dart';

import '../../Utils/Constants/AppColors.dart';
import '../../Utils/Constants/bottomsheetInfo.dart';


class UpdateData extends GetView<UpdateDataController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBDFAF0),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Image(image: AssetImage('assets/monlmo.png')),
        ),
      ),
    );
  }


}