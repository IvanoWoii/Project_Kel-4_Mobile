import 'package:app_pron/login.dart';
import 'package:app_pron/page/editProfile.dart';
import 'package:app_pron/page/infoAplikasi.dart';
import 'package:app_pron/page/mainPrint2.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";
  String email = "";

  Future getNama() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? "");
      email = (prefs.getString('email') ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    getNama();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Logout"),
                            content: Text("Apakah Anda Ingin Logout?"),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, left: 20.0),
                                    child: MaterialButton(
                                      padding: EdgeInsets.all(8.0),
                                      color: Colors.redAccent,
                                      onPressed: () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        prefs.setBool('isLoggedIn', false);
                                        await prefs.setString(
                                          'id_user',
                                          "",
                                        );
                                        await prefs.setString(
                                          'username',
                                          "",
                                        );
                                        await prefs.setString(
                                          'email',
                                          "",
                                        );
                                        await prefs.setString(
                                          'password',
                                          "",
                                        );
                                        await prefs.setString(
                                          'no_hp',
                                          "",
                                        );
                                        await prefs.setString(
                                          'role',
                                          "",
                                        );
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => login()));
                                        Fluttertoast.showToast(
                                            msg: "Berhasil Logout",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white);
                                      },
                                      child: Text("iya",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, left: 20.0),
                                    child: MaterialButton(
                                      padding: EdgeInsets.all(8.0),
                                      color: Colors.green,
                                      onPressed: () {
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Profile()));
                                      },
                                      child: Text("Tidak",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ));
                },
                icon: Icon(Icons.logout_rounded)),
          ],
        ),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(content: Text("tekan lagi untuk keluar")),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage("img/logoBundar.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      username,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                    Text(
                      email,
                      style: GoogleFonts.openSans(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.purple),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                StadiumBorder()),
                            side: MaterialStateProperty.all(BorderSide.none)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editProfile()));
                        },
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Divider(),
                    SizedBox(height: 10),
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPrint2()));
                      },
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.purple.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.print_rounded,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "PRON PRINT",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(color: Colors.black)),
                      ),
                      trailing: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => InfoApp()));
                      },
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.purple.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.info_rounded,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "Info Aplikasi",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(color: Colors.black)),
                      ),
                      trailing: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {Key? key, required this.text, required this.icon, this.press})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 7),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.purple,
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.purple),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(width: 20),
            Expanded(
                child: Text(text,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(color: Colors.black)))),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
