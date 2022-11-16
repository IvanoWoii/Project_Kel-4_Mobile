import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_pron/lupa_password_page/email_add.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('R E S E T P A S S W O R D',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.purpleAccent[700])),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              size: 20.0, color: Colors.purpleAccent[700]),
          onPressed: () {},
        ),
      ),
      body: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('animasi/${index + 1}.json',
                    height: 300,
                    reverse: true,
                    repeat: true,
                    fit: BoxFit.cover),
                SizedBox(height: 20),
                Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Siapkan Email Anda Untuk Mendapatkan Kode Verifikasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EmailAdd()));
                  },
                  child: Text("Next",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ],
            );
          }),
    );
  }
}
