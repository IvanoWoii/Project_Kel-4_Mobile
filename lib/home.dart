import 'package:app_pron/page/mainPrint2.dart';
import 'package:app_pron/page/notifMenu.dart';
import 'package:flutter/material.dart';
import 'package:app_pron/page/dashboard.dart';
import 'package:app_pron/page/profile.dart';
import 'package:app_pron/page/riwayat.dart';
import 'package:app_pron/page/kategori.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [Dashboard(), Riwayat(), Profile(), Kategori()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  final isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.print_outlined,
        backgroundColor: Colors.purple,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 12,
        spaceBetweenChildren: 12,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyPrint2()));
              },
              child: Icon(Icons.print, color: Colors.white),
              label: "print",
              backgroundColor: Colors.black),
          SpeedDialChild(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => NotifMenu()));
              },
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              label: "notif",
              backgroundColor: Colors.black),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(15.0)),
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
                  Padding(padding: EdgeInsets.all(15.0)),
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
                  Padding(padding: EdgeInsets.all(15.0)),
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
                  Padding(padding: EdgeInsets.all(15.0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
