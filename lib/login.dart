import 'dart:async';
import 'dart:convert';

import 'package:app_pron/page/profile.dart';
import 'package:app_pron/pages_index/headerWidget.dart';
import 'package:app_pron/pages_index/theme_helper.dart';
import 'package:app_pron/lupa_password_page/reset_password.dart';
import 'package:app_pron/register.dart';
import 'package:app_pron/splashscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_pron/url.dart';
import 'package:app_pron/bottNav.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  bool isPasswordVisible = false;
  bool _visible = false;

  List result = [];

  Future<void> _login() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/user/login.php?username=${user.text.toString()}&password=${pass.text.toString()}");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      var msg = jsonDecode(response.body);

      //Check Login Status
      if (msg['loginStatus'] == true) {
        setState(() {
          //hide progress indicator
          _visible = false;
        });
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);

        await prefs.setString(
          'id_user',
          msg['userInfo']['id_user'],
        );
        await prefs.setString(
          'username',
          msg['userInfo']['username'],
        );
        await prefs.setString(
          'email',
          msg['userInfo']['email'],
        );
        await prefs.setString(
          'password',
          msg['userInfo']['password'],
        );
        await prefs.setString(
          'no_hp',
          msg['userInfo']['no_hp'],
        );
        await prefs.setString(
          'role',
          msg['userInfo']['role'],
        );
        // Navigate to Home Screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => kumNav()));
      } else {
        setState(() {
          //hide progress indicator
          _visible = false;

          //Show Error Message Dialog
          showMessage(msg["message"]);
        });
      }
    } else {
      setState(() {
        //hide progress indicator
        _visible = false;

        //Show Error Message Dialog
        showMessage("Error during connecting to Server.");
      });
    }
  }

  Future<void> showMessage(String _msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(_msg),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child:
                  HeaderWidget(_headerHeight, true, Image.asset("Group 4.png")),
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Silahkan Login',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Masukan username yang benar";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: user,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Masukan username'),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  // validator: (value) {
                                  //   if (value!.isEmpty ||
                                  //       !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                  //           .hasMatch(value)) {
                                  //     return "Masukan password yang benar";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  controller: pass,
                                  obscureText: isPasswordVisible ? false : true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Password",
                                    hintText: "Masukan Password",
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      child: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                              //   alignment: Alignment.topRight,
                              //   child: GestureDetector(
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 ResetPassword()),
                              //       );
                              //     },
                              //     child: Text(
                              //       "Lupa Password?",
                              //       style: TextStyle(
                              //         color: Colors.grey,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'login'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {
                                    final isValidForm =
                                        _formKey.currentState!.validate();
                                    if (isValidForm) {
                                      _login();
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Tidak Punya Akun?"),
                                  TextSpan(
                                    text: ' Register',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyRegister()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(250, 74, 35, 78)),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
