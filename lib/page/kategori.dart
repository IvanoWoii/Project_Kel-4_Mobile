import 'package:app_pron/pages_index/tabsKategori.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Kategori",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
          ),
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(content: Text("tekan lagi untuk keluar")),
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(
                    icon: Icon(
                      Icons.people,
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      "Alat Tulis",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.category_sharp, color: Colors.deepPurple),
                    child: Text(
                      "Alat Ukur",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.category_sharp, color: Colors.deepPurple),
                    child: Text(
                      "Alat Lain-Lain",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ]),
                Expanded(
                  child: TabBarView(
                    children: [Tabs1(), Tabs2(), Tabs3()],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
