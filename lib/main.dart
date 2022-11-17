import 'package:app_pron/home.dart';
import 'package:app_pron/page/mainPrint2.dart';
import 'package:app_pron/register.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'login.dart';
import 'package:app_pron/lupa_password_page/reset_password.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "APP PRON",
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
