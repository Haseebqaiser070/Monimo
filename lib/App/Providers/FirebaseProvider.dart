import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/Services/AuthServices.dart';
import 'package:monimo/App/Services/CurrentUserData.dart';
import 'package:monimo/App/models/UserData.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';

class FirebaseProvider extends GetxService {
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;
  late FirebaseStorage _firebaseStorage;

  // Initialize Objects
  Future<FirebaseProvider> init() async {
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
    _firebaseStorage = FirebaseStorage.instance;
    return this;
  }

  // ************ User Authentications ***************
  Future<bool> passwordSignup(
      String name, String email, String password) async {
    try {
      return _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        return await createCurrentUser(name, email,"password");
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> passwordSignin(String email, String password) async {
    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => true)
        .catchError((e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    });
  }

  //Sign in with Google
  Future<bool> googleSignin() async {
    bool result = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          print(user.displayName);
          String username = user.displayName??'';
          String useremail = user.email??'';
          result = await createCurrentUser(username, useremail,"google");
        }
      }
      return result;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return result;
    }
  }


  // Sign in with Apple
  Future<bool> appleSignin() async{
    bool result = false;
    try{
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      UserCredential userCredential = await _auth.signInWithCredential(oauthCredential);
      final User? user = userCredential.user;
      if (user != null) {
        print(user.displayName);
        String username = user.displayName??'';
        String useremail = user.email??'';
        result = await createCurrentUser(username, useremail,"apple");
      }
      return result;
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
      return result;
    }
  }


  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }


  // logout user
  Future logout() async {
    if (_auth.currentUser != null) {
      await _auth.signOut();
      AuthServices authServices = Get.find();
      await authServices.init();
      Get.offAllNamed(Routes.IntroScreen);
    }
  }

// ************ User Authentications ***************

// ************ User Firestore ***************

  //save current user data
  Future<bool> createCurrentUser(String name, String email, String provider) async {
    if (_auth.currentUser != null) {
      try {
        final uid = _auth.currentUser!.uid;
        DocumentReference documentReference =
            _firestore.collection("Users").doc(uid);
        UserData userData = UserData(
            name: name,
            email: email,
            docReference: documentReference,
            createAt: DateTime.now(),
          provider: provider
        );
        return documentReference.set(userData.toMap()).then((value) => true);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return false;
      }
    }
    return false;
  }

  // get current user data
  Future<UserData> getUserData() async {
      try{
        if(_auth.currentUser != null){
          return _firestore.collection("Users").doc(_auth.currentUser!.uid).get().then((value){
            if(value.data() == null) return UserData();
            return UserData.fromJson(value.data()!);
          });
        }
        return UserData();
      }catch(e){
        print(e);
        return UserData();
      }
  }

// ************ User Firestore ***************
}
