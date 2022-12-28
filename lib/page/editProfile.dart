import 'dart:convert';

import 'package:app_pron/pages_index/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_pron/url.dart';
import 'package:http/http.dart' as http;

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  bool isPasswordVisible = false;

  String? id_user;
  String? username;
  String? email;
  String? password;
  String? no_hp;

  Future getDataProfile() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      id_user = (prefs.getString('id_user') ?? "");
      username = (prefs.getString('username') ?? "");
      email = (prefs.getString('email') ?? "");
      password = (prefs.getString('password') ?? "");
      no_hp = (prefs.getString('no_hp') ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    getDataProfile();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController id = TextEditingController(text: id_user);
    final TextEditingController user = TextEditingController(text: username);
    final TextEditingController emailTxt = TextEditingController(text: email);
    final TextEditingController pass = TextEditingController(text: password);
    final TextEditingController noHpUser = TextEditingController(text: no_hp);
    Future<void> editProfile() async {
      var url = Uri.parse(
          "http://${Url.URL_API}/project_mobile/user/editProfile.php");
      var response = await http.post(url, body: {
        "username": user.text.toString(),
        "email": emailTxt.text.toString(),
        "password": pass.text.toString(),
        "no_hp": noHpUser.text.toString(),
        "id_user": id.text
      });
      var data = jsonDecode(response.body);
      // print(dataJadi);
      if (data == "gagal") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("data sudah ada")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Edit Berhasil")),
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', user.text.toString());
        await prefs.setString('email', emailTxt.text.toString());
        await prefs.setString('password', pass.text.toString());
        await prefs.setString('no_hp', noHpUser.text.toString());
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(53),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Edit Profile",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(color: Colors.white)),
            ),
            backgroundColor: Colors.purple,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 24,
              color: Colors.white,
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            new Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)),
                            Text("Id User : $id_user"),
                            new Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5)),
                            Container(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Data tidak boleh kosong";
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
                            new Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)),
                            Container(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Data tidak boleh kosong";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailTxt,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Email', 'Masukan Email'),
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            new Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)),
                            Container(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Data tidak boleh kosong";
                                  } else {
                                    return null;
                                  }
                                },
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
                                        isPasswordVisible = !isPasswordVisible;
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
                            new Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)),
                            Container(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Data tidak boleh kosong";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: noHpUser,
                                decoration: ThemeHelper().textInputDecoration(
                                    'No Hp', 'Masukan No Hp'),
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    editProfile();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Proses")),
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Simpan',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.purple),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(StadiumBorder()),
                                    side: MaterialStateProperty.all(
                                        BorderSide.none)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
