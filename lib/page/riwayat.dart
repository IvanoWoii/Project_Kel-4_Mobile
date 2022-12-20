import 'dart:convert';

import 'package:app_pron/pages_index/dataPrint.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Riwayat extends StatefulWidget {
  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  List<dataPrint>? apiList;

  Future<void> getDataPrint() async {
    Uri url = Uri.parse("http://192.168.1.16/project_mobile/getDataBarang.php");
    var respone = await http.get(url);

    apiList = jsonDecode(respone.body)
        .map((item) => dataPrint.fromJson(item))
        .toList()
        .cast<dataPrint>();
  }

  @override
  void initState() {
    super.initState();
    getDataPrint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
        centerTitle: true,
      ),
      body: Column(
        children: [if (apiList != null) getPrint()],
      ),
    );
  }

  Widget getPrint() {
    return Expanded(
      child: ListView.builder(
          itemCount: apiList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text("${apiList![index].harga}"),
                  ),
                )
              ],
            );
          }),
    );
  }
}
