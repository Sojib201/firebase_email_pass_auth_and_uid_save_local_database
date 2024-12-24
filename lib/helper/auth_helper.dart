import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_pass_auth_and_uid_save_local_databaseee/UI/sign%20in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../UI/home screen.dart';

class AuthHelper {
  final box = GetStorage();

  Future SignUp(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;
      print(authCredential);
      if (authCredential!.uid.isNotEmpty) {
        box.write('id', authCredential.uid);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(),
          ),
        );
      } else {
        print("sign up failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future SignIn(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;
      print(authCredential);
      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        print("sign up failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
