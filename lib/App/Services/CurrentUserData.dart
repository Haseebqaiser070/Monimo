import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:monimo/App/Providers/FirebaseProvider.dart';
import 'package:monimo/App/models/UserData.dart';

class CurrentUserData extends GetxService{

  Future<CurrentUserData> init()async{
    _firebaseProvider = Get.find();
    _auth = Get.find();
    _getUser();
    return this;
  }

  late FirebaseProvider _firebaseProvider;
  late FirebaseAuth _auth;

  late String _name;
  late String _email;
  late DocumentReference _docReference;
  late DateTime _createAt;



  Future _getUser()async{
    if(_auth.currentUser != null){
      UserData userData = await _firebaseProvider.getUserData();
      _name = userData.name??'';
      _email = userData.email??'';
      _docReference = userData.docReference!;
      _createAt = userData.createAt!;
      // GetStorage().write('docReference', userData.docReference);
      // GetStorage().write('name', userData.name);
      // GetStorage().write('email', userData.email);
      // GetStorage().write('createAt', userData.createAt);
    }
  }

  DocumentReference get docReference => _docReference;
  String get name => _name;
  String get email => _email;
  DateTime get createAt => _createAt;
}