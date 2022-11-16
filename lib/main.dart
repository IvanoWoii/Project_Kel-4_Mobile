import 'package:app_pron/home.dart';
import 'package:app_pron/page/mainPrint.dart';
import 'package:app_pron/register.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "APP PRON",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
