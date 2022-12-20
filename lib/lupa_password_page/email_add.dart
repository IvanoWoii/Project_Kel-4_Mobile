import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_pron/lupa_password_page/verif_email.dart';
import 'package:app_pron/lupa_password_page/reset_password.dart';

class EmailAdd extends StatefulWidget {
  const EmailAdd({super.key});

  @override
  State<EmailAdd> createState() => _EmailAddState();
}

class _EmailAddState extends State<EmailAdd> {
  bool isObscurePassword = true;
  @override
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
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ResetPassword()));
          },
        ),
      ),
      body: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('animasi/${index + 3}.json',
                      height: 200,
                      reverse: true,
                      repeat: true,
                      fit: BoxFit.cover),
                  SizedBox(height: 20),
                  Text(
                    "Masukkan Email",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Masukkan Email Anda Untuk Mendapatkan Kode Verifikasi",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: buildTextField("Email", "Email", false)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifEmail()));
                    },
                    child: Text("Kirim",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                    onPressed: () {},
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
  }
}
