import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_pron/lupa_password_page/verif_email.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('C R E A T E P A S S W O R D',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.purpleAccent[700])),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              size: 20.0, color: Colors.purpleAccent[700]),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => VerifEmail()));
          },
        ),
      ),
      body: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('animasi/${index + 3}.json',
                    height: 200,
                    reverse: true,
                    repeat: true,
                    fit: BoxFit.cover),
                SizedBox(height: 20),
                Text(
                  "Masukkan Password",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Buat Password Anda Yang Baru",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child:
                        buildTextField("New Password", "New Password", true)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: buildTextField(
                        "Confirm Password", "Confirm Password", true)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Save",
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
