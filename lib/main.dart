import 'package:app_pron/page/kategori.dart';
import 'package:app_pron/page/mainPrint2.dart';
import 'package:app_pron/page/kategori.dart';
import 'package:app_pron/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splashscreen.dart';
import 'login.dart';
import 'package:app_pron/bottNav.dart';
import 'package:app_pron/lupa_password_page/reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "APP PRON",
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? kumNav() : login(),
    );
  }
}
