import 'dart:convert';

import 'package:app_pron/pages_index/indexRiwayat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_pron/url.dart';
import 'package:http/http.dart' as http;

class TabsPending extends StatefulWidget {
  const TabsPending({super.key});

  @override
  State<TabsPending> createState() => _TabsPendingState();
}

class _TabsPendingState extends State<TabsPending> {
  List<DataRiwayat>? lisPending;
  String idUser = "";

  Future getIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = (prefs.getString('id_user') ?? "");
      // print(idUser);
    });
  }

  Future<void> getDataRiwayatPending() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/riwayat/riwayatPending.php");
    var response = await http.post(url, body: {"id_user": idUser.toString()});
    setState(() {
      lisPending = jsonDecode(response.body)
          .map((item) => DataRiwayat.fromJson(item))
          .toList()
          .cast<DataRiwayat>();
    });
  }

  @override
  void initState() {
    super.initState();
    getDataRiwayatPending();
    getIdUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: getDataRiwayatPending,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 5,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.purple),
          ),
          if (lisPending != null)
            Expanded(
              child: ListView.builder(
                  itemCount: lisPending!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                  style: BorderStyle.solid),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  spreadRadius: 0.8,
                                  blurRadius: 9,
                                  offset: const Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    child: Icon(Icons.monetization_on_rounded,
                                        color: Colors.white),
                                    backgroundColor: Colors.purple,
                                  ),
                                ],
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    "ID Transaksi: ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 12)),
                                  ),
                                  Text(
                                    "${lisPending![index].idTransaksi}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    "Tanggal : ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 10)),
                                  ),
                                  Text(
                                    "${lisPending![index].tanggal}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rp. ${lisPending![index].totalHarga}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Text(
                                    "${lisPending![index].status}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: lisPending![index].status ==
                                                    "pending"
                                                ? Colors.red
                                                : Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
        ],
      ),
    ));
  }
}

class TabsOnProses extends StatefulWidget {
  const TabsOnProses({super.key});

  @override
  State<TabsOnProses> createState() => _TabsOnProsesState();
}

class _TabsOnProsesState extends State<TabsOnProses> {
  List<DataRiwayat>? lisPending;
  String idUser = "";

  Future getIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = (prefs.getString('id_user') ?? "");
      // print(idUser);
    });
  }

  Future<void> getDataRiwayatSelesaiOnProses() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/riwayat/riwayatOnProses.php");
    var response = await http.post(url, body: {"id_user": idUser.toString()});
    setState(() {
      lisPending = jsonDecode(response.body)
          .map((item) => DataRiwayat.fromJson(item))
          .toList()
          .cast<DataRiwayat>();
    });
  }

  @override
  void initState() {
    super.initState();
    getDataRiwayatSelesaiOnProses();
    getIdUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: getDataRiwayatSelesaiOnProses,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 5,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.purple),
          ),
          if (lisPending != null)
            Expanded(
              child: ListView.builder(
                  itemCount: lisPending!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                  style: BorderStyle.solid),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  spreadRadius: 0.8,
                                  blurRadius: 9,
                                  offset: const Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    child: Icon(Icons.monetization_on_rounded,
                                        color: Colors.white),
                                    backgroundColor: Colors.purple,
                                  ),
                                ],
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    "ID Transaksi: ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 12)),
                                  ),
                                  Text(
                                    "${lisPending![index].idTransaksi}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    "Tanggal : ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 10)),
                                  ),
                                  Text(
                                    "${lisPending![index].tanggal}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rp. ${lisPending![index].totalHarga}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Text(
                                    "${lisPending![index].status}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: lisPending![index].status ==
                                                    "pending"
                                                ? Colors.red
                                                : Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
        ],
      ),
    ));
  }
}

class TabsSiapDiAmbil extends StatefulWidget {
  const TabsSiapDiAmbil({super.key});

  @override
  State<TabsSiapDiAmbil> createState() => _TabsSiapDiAmbilState();
}

class _TabsSiapDiAmbilState extends State<TabsSiapDiAmbil> {
  List<DataRiwayat>? lisPending;
  String idUser = "";

  Future getIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = (prefs.getString('id_user') ?? "");
      // print(idUser);
    });
  }

  Future<void> getDataRiwayatSelesaiSiapDiAmbil() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/riwayat/riwayatSiapAmbil.php");
    var response = await http.post(url, body: {"id_user": idUser.toString()});
    setState(() {
      lisPending = jsonDecode(response.body)
          .map((item) => DataRiwayat.fromJson(item))
          .toList()
          .cast<DataRiwayat>();
    });
  }

  @override
  void initState() {
    super.initState();
    getDataRiwayatSelesaiSiapDiAmbil();
    getIdUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: getDataRiwayatSelesaiSiapDiAmbil,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 5,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.purple),
          ),
          if (lisPending != null)
            Expanded(
              child: ListView.builder(
                  itemCount: lisPending!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                  style: BorderStyle.solid),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  spreadRadius: 0.8,
                                  blurRadius: 9,
                                  offset: const Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: (() async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Konfirmasi Customer"),
                                        content: Text(
                                            "Apakah Barang Sudah Diterima Customer?"),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20, left: 20),
                                                child: MaterialButton(
                                                  padding: EdgeInsets.all(8.0),
                                                  color: Colors.redAccent,
                                                  onPressed: (() {
                                                    Navigator.pop(context);
                                                  }),
                                                  child: Text(
                                                    "Tidak",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              MaterialButton(
                                                padding: EdgeInsets.all(8.0),
                                                color: Colors.green,
                                                onPressed: (() {
                                                  print("test");
                                                }),
                                                child: Text(
                                                  "Iya",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    });
                              }),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    child: Icon(Icons.monetization_on_rounded,
                                        color: Colors.white),
                                    backgroundColor: Colors.purple,
                                  ),
                                ],
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    "ID Transaksi: ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 12)),
                                  ),
                                  Text(
                                    "${lisPending![index].idTransaksi}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    "Tanggal : ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 10)),
                                  ),
                                  Text(
                                    "${lisPending![index].tanggal}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rp. ${lisPending![index].totalHarga}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Text(
                                    "${lisPending![index].status}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: lisPending![index].status ==
                                                    "pending"
                                                ? Colors.red
                                                : Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
        ],
      ),
    ));
  }
}

class TabsSelesai extends StatefulWidget {
  const TabsSelesai({super.key});

  @override
  State<TabsSelesai> createState() => _TabsSelesaiState();
}

class _TabsSelesaiState extends State<TabsSelesai> {
  List<DataRiwayat>? lisPending;
  String idUser = "";

  Future getIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = (prefs.getString('id_user') ?? "");
      // print(idUser);
    });
  }

  Future<void> getDataRiwayatSelesai() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/riwayat/riwayatSelesai.php");
    var response = await http.post(url, body: {"id_user": idUser.toString()});
    setState(() {
      lisPending = jsonDecode(response.body)
          .map((item) => DataRiwayat.fromJson(item))
          .toList()
          .cast<DataRiwayat>();
    });
  }

  @override
  void initState() {
    super.initState();
    getDataRiwayatSelesai();
    getIdUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: getDataRiwayatSelesai,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 5,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.purple),
          ),
          if (lisPending != null)
            Expanded(
              child: ListView.builder(
                  itemCount: lisPending!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                  style: BorderStyle.solid),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  spreadRadius: 0.8,
                                  blurRadius: 9,
                                  offset: const Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    child: Icon(Icons.monetization_on_rounded,
                                        color: Colors.white),
                                    backgroundColor: Colors.purple,
                                  ),
                                ],
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    "ID Transaksi: ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 12)),
                                  ),
                                  Text(
                                    "${lisPending![index].idTransaksi}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    "Tanggal : ",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black, fontSize: 10)),
                                  ),
                                  Text(
                                    "${lisPending![index].tanggal}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rp. ${lisPending![index].totalHarga}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Text(
                                    "${lisPending![index].status}",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: lisPending![index].status ==
                                                    "pending"
                                                ? Colors.red
                                                : Colors.blue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
        ],
      ),
    ));
  }
}
