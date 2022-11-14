import 'package:app_pron/page/profile.dart';
import 'package:app_pron/pages_index/headerWidget.dart';
import 'package:app_pron/pages_index/theme_helper.dart';
import 'package:app_pron/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatelessWidget {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight, true, Image.asset("logo no bg.png")),
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
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Masukan username'),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Masukan password'),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: Text(
                                    "Lupa Password?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
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
                                  onPressed: () {
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Profile()));
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
      // body: SafeArea(
      //     child: Container(
      //   width: MediaQuery.of(context).size.width,
      //   decoration: new BoxDecoration(
      //     gradient: new LinearGradient(
      //       begin: FractionalOffset.topLeft,
      //       end: FractionalOffset.bottomRight,
      //       colors: [Color.fromARGB(250, 175, 1, 113), Colors.purpleAccent],
      //     ),
      //   ),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Column(
      //           children: [
      //             Container(
      //               child: Icon(
      //                 Icons.login_rounded,
      //                 size: 80,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(height: 20),
      //         Text(
      //           "Selamat Datang Kembali",
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(
      //           "Silahkan Melukukan Login",
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               fontFamily: "Monsterart"),
      //         ),
      //         SizedBox(height: 50),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //           child: Container(
      //             decoration: BoxDecoration(
      //                 color: Colors.grey[200],
      //                 border: Border.all(color: Colors.white),
      //                 borderRadius: BorderRadius.circular(12)),
      //             child: Padding(
      //               padding: const EdgeInsets.only(left: 20.0),
      //               child: TextField(
      //                 decoration: InputDecoration(
      //                     border: InputBorder.none,
      //                     hintText: 'username',
      //                     prefixIcon: Icon(Icons.people)),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 10),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //           child: Container(
      //             decoration: BoxDecoration(
      //                 color: Colors.grey[200],
      //                 border: Border.all(color: Colors.white),
      //                 borderRadius: BorderRadius.circular(12)),
      //             child: Padding(
      //               padding: const EdgeInsets.only(left: 20.0),
      //               child: TextField(
      //                 obscureText: true,
      //                 decoration: InputDecoration(
      //                     border: InputBorder.none, hintText: 'password'),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //           child: Container(
      //             padding: EdgeInsets.all(20),
      //             decoration: BoxDecoration(
      //                 color: Color.fromARGB(180, 17, 255, 0),
      //                 borderRadius: BorderRadius.circular(12)),
      //             child: Center(
      //                 child: Text(
      //               "Login",
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontFamily: "Monsterart",
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 18),
      //             )),
      //           ),
      //         ),
      //         SizedBox(height: 25),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               "Belum punya akun?",
      //               style: TextStyle(color: Colors.white),
      //             ),
      //             TextButton(
      //               onPressed: () {
      //                 Route route =
      //                     MaterialPageRoute(builder: (context) => MyRegister());
      //                 Navigator.push(context, route);
      //               },
      //               child: Text(" Register",
      //                   style: TextStyle(
      //                       color: Colors.yellow, fontWeight: FontWeight.bold)),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // )),
    );
  }
}
