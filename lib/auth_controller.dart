

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunibest/login_page.dart';
import 'package:tunibest/welcome_page.dart';

import 'myRoutes.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;



  @override
  void onReady() {
    super.onReady();
    _user = auth.currentUser as Rx<User?>;
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }
    @override
    _initialScreen(User? user) {
      if (user == null) {
        print("login page");
        Get.offAll(() => LoginPage());
      } else {
        Get.offAll(() => WelcomePage(email: user.email!));
      }
    }

  void register(String email, password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      Get.snackbar("about user", "user message",backgroundColor: Colors.redAccent, snackPosition: SnackPosition.BOTTOM, titleText: Text("Account creation failed", style: TextStyle(
        color: Colors.white
      ),),
      messageText: Text(
        e.toString(),
        style: TextStyle(
          color: Colors.white
        ),
      )
      );
    }

  }
  void login(String email, password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("about Login", "Login message",backgroundColor: Colors.redAccent, snackPosition: SnackPosition.BOTTOM, titleText: Text("Login failed", style: TextStyle(
          color: Colors.white
      ),),
          messageText: Text(
            e.toString(),
            style: TextStyle(
                color: Colors.white
            ),
          )
      );
    }

  }
  void logOut()async{
    await auth.signOut();
  }

}