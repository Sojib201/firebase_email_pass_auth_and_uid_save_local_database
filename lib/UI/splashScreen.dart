import 'dart:async';
import 'package:firebase_email_pass_auth_and_uid_save_local_databaseee/UI/sign%20in.dart';
import 'package:firebase_email_pass_auth_and_uid_save_local_databaseee/UI/sign%20up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final box = GetStorage();

  chooseScreen(context) async {
    var userId = await box.read('id');

    if (userId != null) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => LogIn()));
    } else {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => SignUp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      chooseScreen(context);
    });
    return Scaffold(
      body: Container(
        color: Colors.grey,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        // child: Image.network(
        //   "https://cdn.dribbble.com/users/7505068/screenshots/15502898/splash_screen_muse.png?compress=1&resize=400x300",
        //   fit: BoxFit.fill,
        // ),
      ),
    );
  }
}
