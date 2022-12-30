import 'package:app_pron/pages_index/gridDasborad.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                  color: Colors.purple.shade700.withOpacity(1.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5.0,
                        blurRadius: 7.0),
                  ],
                  // gradient: new LinearGradient(
                  //   begin: FractionalOffset.centerLeft,
                  //   end: FractionalOffset.bottomRight,
                  //   colors: [
                  //     Color.fromARGB(250, 74, 35, 78).withOpacity(0.8),
                  //     Color.fromARGB(250, 155, 11, 203).withOpacity(0.8),
                  //   ],
                  // ),
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("img/headerfoto.png"),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dashboard APP PRON",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Home",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 161, 156, 168),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5.0,
                        blurRadius: 7.0),
                  ]),
            ),
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}
