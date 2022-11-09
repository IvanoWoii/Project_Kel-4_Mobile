import 'package:app_pron/register.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      debugShowCheckedModeBanner: false,
      home: MyRegister(),
    );
  }
}
