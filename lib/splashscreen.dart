import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'login.dart';

class SplahScreen extends StatefulWidget {
  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      gradientBackground: LinearGradient(
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomRight,
        colors: [Color.fromARGB(250, 175, 1, 113), Colors.purpleAccent],
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
    // return Scaffold(
    //   body: Container(
    //     width: MediaQuery.of(context).size.width,
    //     decoration: new BoxDecoration(
    //       gradient: new LinearGradient(
    //         begin: FractionalOffset.topLeft,
    //         end: FractionalOffset.bottomRight,
    //         colors: [Color.fromARGB(250, 175, 1, 113), Colors.purpleAccent],
    //       ),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Image.asset(
    //           "img/logo no bg.png",
    //           width: 300,
    //           height: 300,
    //         ),
    //         Text(
    //           "Tempat Dimana Print Tanpa Antri",
    //           style: TextStyle(
    //               color: Colors.white,
    //               fontWeight: FontWeight.bold,
    //               fontSize: 20,
    //               fontFamily: "Monsterart"),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
