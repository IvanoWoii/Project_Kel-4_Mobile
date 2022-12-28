import 'dart:convert';

import 'package:app_pron/page/dashboard.dart';
import 'package:app_pron/page/kategori.dart';
import 'package:app_pron/page/mainPrint2.dart';
import 'package:app_pron/page/profile.dart';
import 'package:app_pron/page/riwayat.dart';
import 'package:app_pron/pages_index/indexRiwayat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_pron/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class kumNav extends StatefulWidget {
  const kumNav({Key? key}) : super(key: key);
  @override
  State<kumNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<kumNav> {
  String id_user = "";
  String username = "";
  String email = "";
  String password = "";
  String no_hp = "";
  String role = "";

  int _selectedIndex = 0;

  Future getkode() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      id_user = (prefs.getString('id_user') ?? "");
      username = (prefs.getString('username') ?? "");
      email = (prefs.getString('email') ?? "");
      password = (prefs.getString('password') ?? "");
      no_hp = (prefs.getString('no_hp') ?? "");
      role = (prefs.getString('role') ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    getkode();
  }

  int currentTab = 0;
  final List<Widget> screens = [Dashboard(), Riwayat(), Profile(), Kategori()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  final isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(225, 64, 66, 88),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyPrint2()));
        },
        child: Icon(
          Icons.print,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.purple : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Colors.purple
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 1.0)),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Riwayat();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list,
                          color: currentTab == 1 ? Colors.purple : Colors.grey,
                        ),
                        Text(
                          'Riwayat',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.purple
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 30.0)),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Kategori();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category_rounded,
                          color: currentTab == 2 ? Colors.purple : Colors.grey,
                        ),
                        Text(
                          'Kategori',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Colors.purple
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 2.0)),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: currentTab == 3 ? Colors.purple : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Colors.purple
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
