
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/Services/AuthServices.dart';

class AuthMiddleware extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route) {
    // TODO: implement redirect
    AuthServices authServices = Get.find();
    print("user current status");
    print(authServices.isAuth);
    return authServices.isAuth? const RouteSettings(name: Routes.RootScreen,arguments: 0):null;
  }
}