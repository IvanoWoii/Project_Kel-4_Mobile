import 'dart:convert';

import 'package:app_pron/home.dart';
import 'package:app_pron/login.dart';
import 'package:app_pron/pages_index/theme_helper.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          primaryColor: Colors.blue,
          focusColor: Colors.blue),
      home: MyRegister(),
    );
  }
}

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _formKey = GlobalKey<FormState>();

  bool maleSelected = false;

  bool femaleSelected = false;

  bool isPasswordVisible = false;

  bool isConfirmPasswordVisible = false;

  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  TextEditingController nohp = TextEditingController();

  Future<void> _register() async {
    Uri url =
        Uri.parse("http://192.168.203.52/project_mobile/user/register.php");
    var response = await http.post(url, body: {
      "username": user.text,
      "email": email.text,
      "password": pass.text,
      "ho_hp": nohp.text,
      "role": "customer",
    });
    var data = jsonDecode(response.body);
    if (data == "gagal") {
      Fluttertoast.showToast(
          msg: "User ini sudah ada",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else
      Fluttertoast.showToast(
          msg: "berhasil",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            Color.fromARGB(250, 74, 35, 78),
            Color.fromARGB(250, 155, 11, 203),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: (Colors.transparent),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 45)),
                    Container(
                      child: Icon(
                        Icons.app_registration_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                      // child: new Image.asset("./img/logo no bg.png",
                      //     width: 155, height: 155)
                    ),
                  ],
                ),
                Text(
                  "Silahkan Registrasi",
                  style:
                      GoogleFonts.bebasNeue(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Username tidak boleh kosong";
                                } else {
                                  return null;
                                }
                              },
                              controller: user,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "Masukan Username",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Masukan Username anda",
                                hintStyle: TextStyle(color: Colors.white),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400, width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              )
                            ]),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextFormField(
                              validator: (email) {
                                email != null && !EmailValidator.validate(email)
                                    ? 'masukan email yang valid'
                                    : null;
                              },
                              controller: email,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "Masukan email",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Masukan email anda",
                                hintStyle: TextStyle(color: Colors.white),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400, width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              )
                            ]),
                          ),
                          SizedBox(height: 30),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value != null && value.length < 8) {
                                  return "Minimal panjang password 8";
                                } else {
                                  return null;
                                }
                              },
                              controller: pass,
                              obscureText: isPasswordVisible ? false : true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "Masukan password",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Masukan password anda",
                                hintStyle: TextStyle(color: Colors.white),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400, width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                suffixIconConstraints:
                                    BoxConstraints(minWidth: 45, maxWidth: 46),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              )
                            ]),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                        .hasMatch(value)) {
                                  return "pastikan password sama";
                                } else {
                                  return null;
                                }
                              },
                              controller: pass2,
                              style: TextStyle(color: Colors.white),
                              obscureText:
                                  isConfirmPasswordVisible ? false : true,
                              decoration: InputDecoration(
                                labelText: "Masukan Konfirmasi Password",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Masukan Konfirmasi Password",
                                hintStyle: TextStyle(color: Colors.white),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400, width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                suffixIconConstraints:
                                    BoxConstraints(minWidth: 45, maxWidth: 46),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isConfirmPasswordVisible =
                                          !isConfirmPasswordVisible;
                                    });
                                  },
                                  child: Icon(
                                    isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              )
                            ]),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                        .hasMatch(value)) {
                                  return "No HP Harus Diisi";
                                } else {
                                  return null;
                                }
                              },
                              controller: nohp,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "Masukan No HP",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Masukan No Hp anda",
                                hintStyle: TextStyle(color: Colors.white),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400, width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0)),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              )
                            ]),
                          ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    )),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final isValidForm = _formKey.currentState!.validate();
                    if (isValidForm) {
                      _register();
                    } else {
                      return null;
                    }
                    // _register();
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12.withOpacity(.2),
                              offset: Offset(2, 2))
                        ],
                        borderRadius: BorderRadius.circular(12)
                            .copyWith(bottomRight: Radius.circular(12)),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(180, 17, 255, 0),
                          Color.fromARGB(180, 17, 255, 0)
                        ])),
                    child: Text('Register',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (context) => login());
                        Navigator.push(context, route);
                      },
                      child: Text(" Login",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
