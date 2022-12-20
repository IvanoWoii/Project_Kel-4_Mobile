import 'package:app_pron/pages_index/kategori2.dart';
import 'package:app_pron/pages_index/kertasPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kategori extends StatefulWidget {
  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 20.0),
          children: <Widget>[
            SizedBox(height: 15),
            Text(
              "Kategori",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 38.0)),
            ),
            SizedBox(height: 15),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.purple,
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 50.0, left: 50.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text(
                    "Kertas",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontSize: 21.0)),
                  ),
                ),
                Tab(
                  child: Text(
                    "Alat Tulis",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontSize: 21.0)),
                  ),
                ),
                Tab(
                  child: Text(
                    "ATK",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontSize: 21.0)),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 20.0,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [KertasPages(), Kategori2(), KertasPages()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
