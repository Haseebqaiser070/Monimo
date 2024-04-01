import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:monimo/App/models/UserData.dart';

class AuthServices extends GetxService{

  Future<AuthServices> init()async{
    _auth = FirebaseAuth.instance;
    userData = UserData();
    await getCurrentUser();
    return this;
  }

  late FirebaseAuth _auth;
  late UserData userData;

  Future getCurrentUser()async{
    if(_auth.currentUser == null){
      userData.auth = false;
    }
    else{
      userData.auth = true;
    }
    print("getCurrentUser");
    print(userData.auth);
  }
  bool get isAuth => userData.auth ?? false;
}