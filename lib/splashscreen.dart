import 'dart:async';

import 'package:app_pron/home.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class SplahScreen extends StatefulWidget {
  @override
  State<SplahScreen> createState() => SplahScreenState();
}

class SplahScreenState extends State<SplahScreen> {
  static const String KEYLOGIN = "login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();

    var isLogeedIn = sharePref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if (isLogeedIn != null) {
        if (isLogeedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => login()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      gradientBackground: LinearGradient(
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomRight,
        colors: [
          Color.fromARGB(250, 74, 35, 78),
          Color.fromARGB(250, 155, 11, 203),
        ],
      ),
      logo: Image.asset("img/logo no bg.png"),
      logoWidth: 150.0,
      title: Text(
        "APP PRON",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      showLoader: true,
      loadingText: Text(
        "Loading...",
        style: TextStyle(color: Colors.white),
      ),
      navigator: login(),
      durationInSeconds: 10,
      loaderColor: Colors.white,
    );
  }
}
