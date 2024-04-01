import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/modules/IntroScreen/IntroScreenController.dart';

class IntroScreen extends GetView<IntroScreenController> {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => IntroScreenController());
    // TODO: implement build
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xff1f5e70), Color(0xff76cce3)],
          ),
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Image(
                      width: 100,
                      image: AssetImage('assets/monlmo.png'),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(35),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Form(
                            key: controller.keyForm,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("Enloggen",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium),
                                ),
                                 Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          if(!controller.isLoadingGoogle.value)
                                          controller.googleSignin();
                                        },
                                        child: Obx(()=> controller.isLoadingGoogle.value?
                                            CircularProgressIndicator( color: Color(0xff1f5e70),)
                                            :Image(
                                          width: 50,
                                          image: AssetImage('assets/google.png'),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Image(
                                        width: 50,
                                        image: AssetImage('assets/fb.png'),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          if(!controller.isLoadingApple.value)
                                            controller.appleSignin();
                                        },
                                        child: Obx(()=> controller.isLoadingApple.value?
                                        CircularProgressIndicator( color: Color(0xff1f5e70),):
                                          Image(
                                          width: 50,
                                          image: AssetImage('assets/apple.png'),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: controller.emailC,
                                  validator: (v){
                                    if(v!.isEmpty){
                                      return "Email Eingeben";
                                    }
                                    if(!v.isEmail){
                                      return "Falsche Email";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF2F2F2).withOpacity(0.8),
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: Color(0xFF7A7A7A)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: controller.passC,
                                  validator: (v){
                                    if(v!.isEmpty){
                                      return "Passwort Eingeben";
                                    }
                                    if(v.length <6){
                                      return "mindestens 6 Zeichen";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF2F2F2).withOpacity(0.8),
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Color(0xFF7A7A7A)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Passwort vergessen?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.signin();
                                    },
                                    child: Obx(()=> Text(controller.isLoading.value?"Loading":'Einloggen')),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Wrap(
                                  children: [
                                    Text("Noch kein Account? ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    InkWell(
                                      onTap: () => {Get.toNamed(Routes.Signup)},
                                      child: Text("Account Erstellen",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
