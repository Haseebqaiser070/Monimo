import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{

  UserData({this.auth,this.name,this.email,this.docReference,this.createAt,this.provider});
  bool? auth;
  String? name;
  String? email;
  String? provider;
  DocumentReference? docReference;
  DateTime? createAt;


  Map<String,dynamic> toMap(){
    return {
      'docReference': docReference,
      'createAt': createAt??FieldValue.serverTimestamp(),
      'name': name,
      'email': email,
      'provider': provider
    };
  }

  UserData.fromJson(Map<String,dynamic> json){
    docReference = json['docReference'];
    createAt = json['createAt'].toDate();
    name = json['name'];
    email = json['email'];
    provider = json['provider'];
  }

}