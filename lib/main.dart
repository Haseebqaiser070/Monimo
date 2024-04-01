import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:monimo/App/Providers/FirebaseProvider.dart';
import 'package:monimo/App/Services/AuthServices.dart';
import 'package:monimo/App/Services/CurrentUserData.dart';
import 'package:monimo/App/Utils/Constants/AppTheme/AppTheme.dart';
import 'App/App Routes/AppPages.dart';
import 'App/App Routes/Routes.dart';


Future initServices()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut(() => FirebaseAuth.instance);
  await Get.putAsync(() => AuthServices().init());
  await Get.putAsync(() => FirebaseProvider().init());
  await GetStorage.init();
}



void main() async{
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SplashScreen,
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
