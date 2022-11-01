import 'package:app_pron/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool maleSelected = false;

  bool femaleSelected = false;

  bool isPasswordVisible = false;

  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 68, 76, 137),
            Color.fromARGB(255, 11, 9, 32)
          ])),
      child: Scaffold(
        backgroundColor: (Colors.transparent),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        child: new Image.asset("./img/logo no bg.png",
                            width: 200, height: 200)),
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
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 14.5),
                    decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(minWidth: 45),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 22,
                        ),
                        border: InputBorder.none,
                        hintText: 'Masukkan Username',
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white38)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 14.5),
                    decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(minWidth: 45),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white70,
                          size: 22,
                        ),
                        border: InputBorder.none,
                        hintText: 'Masukkan Email',
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white38)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 14.5),
                    obscureText: isPasswordVisible ? false : true,
                    decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(minWidth: 45),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white70,
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
                            color: Colors.white70,
                            size: 22,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Masukkan Password',
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white38)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 14.5),
                    obscureText: isConfirmPasswordVisible ? false : true,
                    decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(minWidth: 45),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white70,
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
                            color: Colors.white70,
                            size: 22,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Konfirmasi Password',
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white38)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                                .copyWith(bottomRight: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          maleSelected = true;

                          femaleSelected = false;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white60)),
                              child: maleSelected
                                  ? Container(
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white70),
                                    )
                                  : SizedBox()),
                          Text('Laki-Laki',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14.5))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleSelected = true;

                          maleSelected = false;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white60)),
                              child: femaleSelected
                                  ? Container(
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white70),
                                    )
                                  : SizedBox()),
                          Text('Perempuan',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14.5))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
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
                          Color.fromARGB(255, 86, 73, 130),
                          Color.fromARGB(255, 63, 82, 168)
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
                              color: Color.fromARGB(255, 104, 122, 202),
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
