import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KertasPages extends StatelessWidget {
  const KertasPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard(
                    'Kertas A4', 'Rp 500 - 1000', 'img/pulpen.png', context),
                _buildCard(
                    'Kertas A2', 'Rp 700 - 1400', 'img/logo bg.png', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 0.5),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0),
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.category_rounded,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath), fit: BoxFit.contain)),
                ),
              ),
              SizedBox(height: 7.0),
              Text(
                price,
                style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(color: Color(0xFFEF7532), fontSize: 14.0)),
              ),
              Text(
                name,
                style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(color: Color(0xFF575E67), fontSize: 14.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
