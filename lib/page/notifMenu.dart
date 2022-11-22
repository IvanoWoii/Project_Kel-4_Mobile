import 'package:app_pron/home.dart';
import 'package:flutter/material.dart';

class NotifMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
