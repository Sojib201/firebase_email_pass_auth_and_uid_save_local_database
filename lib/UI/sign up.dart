import 'package:firebase_email_pass_auth_and_uid_save_local_databaseee/UI/sign%20in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/auth_helper.dart';

class SignUp extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 30),
                hintText: "Email",
              ),
              controller: email,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 30),
                  border: OutlineInputBorder(),
                  hintText: "Password"),
              controller: pass,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final userEmail = email.text;
                  final userPass = pass.text;

                  // var obj = AuthHelper();
                  final AuthHelper obj = AuthHelper();
                  obj.SignUp(userEmail, userPass, context);
                },
                child: Text("Sign Up"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (context) => LogIn()));
              },
              child: Text("Already Created an Account ? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
