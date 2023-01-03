import 'package:app_pron/pages_index/tabsRiwayat.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Riwayat",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
          ),
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(content: Text("tekan lagi untuk keluar")),
            child: Column(
              children: [
                TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.grey.shade800,
                    indicator: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey.shade200),
                    tabs: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Tab(
                          icon: Icon(
                            Icons.pending_actions_rounded,
                            color: Colors.black,
                          ),
                          child: Text(
                            "Pending",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Tab(
                          icon: Icon(
                            Icons.work,
                            color: Colors.black,
                          ),
                          child: Text(
                            "On Proses",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Tab(
                          icon: Icon(
                            Icons.playlist_add_check,
                            color: Colors.black,
                          ),
                          child: Text(
                            "Siap Di Ambil",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: Tab(
                          icon: Icon(
                            Icons.done_all_rounded,
                            color: Colors.black,
                          ),
                          child: Text(
                            "Selesai",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      TabsPending(),
                      TabsOnProses(),
                      TabsSiapDiAmbil(),
                      TabsSelesai()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
