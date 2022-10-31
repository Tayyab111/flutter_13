import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_complaint_app/screens/forgetPassword.dart';
import 'package:user_complaint_app/screens/login.dart';
import 'package:user_complaint_app/screens/regesternewcomplain.dart';
import 'package:user_complaint_app/screens/register.dart';
import 'package:user_complaint_app/screens/view_complain_list.dart';
import 'package:user_complaint_app/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    /*theme: ThemeData(
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
          primarySwatch: Colors.red,
    ),*/
  home: /*ForgetPassword(),*/FirebaseAuth.instance.currentUser != null ? RegesterNewComplain() : Welcome(),
    debugShowCheckedModeBanner: false,
  ));
}

