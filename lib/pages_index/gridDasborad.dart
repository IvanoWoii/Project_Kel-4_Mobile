import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Item item1 = new Item(
      title: "Kertas A4",
      subtitle: "21 x 29,7cm",
      event: "Rp 500 per lembar (Non Warna)",
      event2: "Rp 1000 per lembar (Warna)",
      img: "img/paperBaru.png");

  Item item2 = new Item(
      title: "Kertas A3",
      subtitle: "29,7 x 42cm",
      event: "Rp 700 per lembar (Non Warna)",
      event2: "Rp 1400 per lembar (Warna)",
      img: "img/paperBaru.png");

  Item item3 = new Item(
      title: "Kertas Buffalo",
      subtitle: "21,5 x 33cm",
      event: "Rp 1000 per lembar (Non Warna)",
      event2: "Rp 1500 per lembar (Warna)",
      img: "img/paperBaru.png");

  Item item4 = new Item(
      title: "Kertas F4",
      subtitle: "21,5 x 33cm",
      event: "Rp 500 per lembar (Non Warna)",
      event2: "Rp 1000 per lembar (Warna)",
      img: "img/paperBaru.png");
  @override
  Widget build(BuildContext context) {
    List<Item> myList = [item1, item2, item3, item4];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 0.8,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 7.0,
                        blurRadius: 7.0),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(data.img, width: 80),
                  SizedBox(height: 14),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 6,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: 14),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 7,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    data.event2,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 7,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Item {
  String title;
  String subtitle;
  String event;
  String event2;
  String img;
  Item(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.event2,
      required this.img});
}
