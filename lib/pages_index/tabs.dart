import 'dart:convert';

import 'package:app_pron/pages_index/dataBarang.dart';
import 'package:app_pron/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

//tab bar 1
class Tabs1 extends StatefulWidget {
  const Tabs1({super.key});

  @override
  State<Tabs1> createState() => _Tabs1State();
}

class _Tabs1State extends State<Tabs1> {
  List<dataBarangTulis>? dataListTulis;

  Future<void> getDataTulis() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/barang/getDataBarangAlatMenulis.php");
    var response = await http.get(url);
    setState(() {
      dataListTulis = jsonDecode(response.body)
          .map((item) => dataBarangTulis.fromJson(item))
          .toList()
          .cast<dataBarangTulis>();
    });
  }

  @override
  void initState() {
    super.initState();
    getDataTulis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (dataListTulis != null)
            Expanded(
              child: ListView.builder(
                itemCount: dataListTulis!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 20, bottom: 20),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            border: Border.all(
                                color: Colors.grey.shade600,
                                width: 1,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                spreadRadius: 0.8,
                                blurRadius: 9,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.wifi_channel_outlined,
                              color: Colors.white,
                            )),
                            title: Row(
                              children: [
                                Text(
                                  "Nama Barang : ",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ),
                                Text(
                                  "${dataListTulis![index].namaBarang.toString().toUpperCase()}",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                )
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Harga : ",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ),
                                Text(
                                  "${dataListTulis![index].harga}",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

//tab bar 2
class Tabs2 extends StatefulWidget {
  const Tabs2({super.key});

  @override
  State<Tabs2> createState() => _Tabs2State();
}

class _Tabs2State extends State<Tabs2> {
  List<dataBarangUkur>? dataListUkur;

  Future<void> getDataUkur() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/barang/getDataBarangAlatUkur.php");
    var response = await http.get(url);
    setState(() {
      dataListUkur = jsonDecode(response.body)
          .map((item) => dataBarangUkur.fromJson(item))
          .toList()
          .cast<dataBarangUkur>();
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUkur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (dataListUkur != null)
            Expanded(
              child: ListView.builder(
                itemCount: dataListUkur!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 20, bottom: 20),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            border: Border.all(
                                color: Colors.grey.shade600,
                                width: 1,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                spreadRadius: 0.8,
                                blurRadius: 9,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                              Icons.wifi_channel_outlined,
                              color: Colors.white,
                            )),
                            title: Row(
                              children: [
                                Text(
                                  "Nama Barang : ",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                ),
                                Text(
                                  "${dataListUkur![index].namaBarang.toString().toUpperCase()}",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                )
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Harga : ",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ),
                                Text(
                                  "${dataListUkur![index].harga}",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

//tab bar 3
class Tabs3 extends StatefulWidget {
  const Tabs3({super.key});

  @override
  State<Tabs3> createState() => _Tabs3State();
}

class _Tabs3State extends State<Tabs3> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
