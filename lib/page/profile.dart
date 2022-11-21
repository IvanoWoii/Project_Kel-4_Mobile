import 'package:app_pron/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('PROFILE',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 25.0,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        )),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Logout"),
                                    content: Text("Apalah Anda Ingin Logout?"),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 40.0, left: 40.0),
                                        child: MaterialButton(
                                          padding: EdgeInsets.all(8.0),
                                          color: Colors.redAccent,
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        login()));
                                          },
                                          child: Text("iya",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 40.0, left: 40.0),
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
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                        icon: Icon(Icons.logout_rounded)),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 65,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person_outline_rounded),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 500,
              color: Colors.transparent,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: buildTitle(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Informasi Profiles',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.purpleAccent[700],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Nama Lengkap'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Alamat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'No Hp'),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Edit Profile'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.purpleAccent[900],
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ],
      );
}
