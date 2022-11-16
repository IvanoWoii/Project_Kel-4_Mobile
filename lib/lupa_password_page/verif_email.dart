import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_app/lupa_password_page/create_password.dart';
import 'package:testing_app/lupa_password_page/email_add.dart';

class VerifEmail extends StatefulWidget {
  const VerifEmail({super.key});

  @override
  State<VerifEmail> createState() => _VerifEmailState();
}

class _VerifEmailState extends State<VerifEmail> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('V E R I F I K A S I',
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
                Lottie.asset('animasi/${index + 2}.json',
                    height: 300,
                    reverse: true,
                    repeat: true,
                    fit: BoxFit.cover),
                SizedBox(height: 20),
                Text(
                  "Masukkan Kode Verifikasi",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Masukkan Kode Verifikasi Yang Telah Terkirim Pada Email Anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePassword()));
                  },
                  child: Text("Verifikasi",
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
