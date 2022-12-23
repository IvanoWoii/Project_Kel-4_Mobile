import 'dart:convert';

import 'package:app_pron/pages_index/dataPrint.dart';
import 'package:app_pron/pages_index/indexRiwayat.dart';
import 'package:flutter/material.dart';
import 'package:app_pron/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Riwayat extends StatefulWidget {
  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  List<riwayat>? apiList;
  String idUSer = "";

  Future getIdUSer() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idUSer = (prefs.getString('id_user') ?? "");
      print(idUSer);
    });
  }

  @override
  void initState() {
    super.initState();
    getDataRiwayat();
    getIdUSer();
  }

  void getDataRiwayat() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/riwayat.php?id_user=${idUSer.toString()}");
    var respone = await http.post(url, body: {"id_user": idUSer});
    setState(() {
      apiList = jsonDecode(respone.body)
          .map((item) => riwayat.fromJson(item))
          .toList()
          .cast<riwayat>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController getId = new TextEditingController(text: idUSer);
    setState(() {
      idUSer;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          if (apiList != null) getRiwayat(),
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: getId,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        getDataRiwayat();
                      },
                      child: Text("tombol"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getRiwayat() {
    return Expanded(
      child: ListView.builder(
          itemCount: apiList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
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
                      onTap: () {},
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
                            "${apiList![index].idTransaksi}",
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
                                    color: Colors.black, fontSize: 12)),
                          ),
                          Text(
                            "${apiList![index].tanggal}",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rp. ${apiList![index].totalHarga}",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24)),
                          ),
                          Text(
                            "${apiList![index].status}",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: apiList![index].status == "pending"
                                        ? Colors.red
                                        : Colors.blue,
                                    fontSize: 14,
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
    );
  }
}
