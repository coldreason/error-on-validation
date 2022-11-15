import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lbp_web/app/modules/home/views/home_view.dart';
import 'package:lbp_web/app/modules/login/views/login_view.dart';

class AuthControllerController extends GetxController {
  static AuthControllerController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  //TODO: Implement AuthControllerController

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) async {
    if (user == null) {
      Get.offAll(() => LoginView());
    } else {
      Get.offAll(() => HomeView());
    }
  }

  dynamic signup(
    String userEmail,
    String userPassword,
  ) async {
    try {
      await authentication.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
    } catch (e) {
      Get.snackbar(
        "Error message",
        "User message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Registration is failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  dynamic signin(String email, password) async {
    try {
      await authentication.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Error message",
        "User message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "log in is failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }
  void logout() {
    authentication.signOut();
  }
}
