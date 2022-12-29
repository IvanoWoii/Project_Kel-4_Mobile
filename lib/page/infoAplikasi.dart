import 'package:app_pron/bottNav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoApp extends StatefulWidget {
  const InfoApp({super.key});

  @override
  State<InfoApp> createState() => _InfoAppState();
}

class _InfoAppState extends State<InfoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "INFO APP",
          style: GoogleFonts.openSans(
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Aplikasi PRON",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28)),
              ),
              Text(
                "Printing Online",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              Text(
                "Versi 1.0.0",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset("img/Group 4.png"),
              ),
              Text(
                "Di Kembangkan Oleh : ",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19)),
              ),
              Text(
                "Muhammad Reza Ivano Pahlevi (Developer)",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
              Text(
                "Muhammad Indra Maulidana (Developer)",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
              Text(
                "Dimas Pratama Putra (Quality Assurance)",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
              Text(
                "Aliva Risqi Mariska (Produk Owner)",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
