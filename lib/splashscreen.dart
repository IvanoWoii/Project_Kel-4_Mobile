import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class SplahScreen extends StatefulWidget {
  @override
  State<SplahScreen> createState() => SplahScreenState();
}

class SplahScreenState extends State<SplahScreen> {
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
      logo: Image.asset("img/Group 4.png"),
      logoWidth: 150.0,
      title: Text(
        "Selamat Datang Di APP PRON",
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
