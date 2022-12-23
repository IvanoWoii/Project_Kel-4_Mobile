import 'dart:convert';
import 'dart:io';

import 'package:app_pron/page/pembayaran.dart';
import 'package:app_pron/pages_index/dataPrint.dart';
import 'package:app_pron/pages_index/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:app_pron/url.dart';

class FileList extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const FileList({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);

  @override
  _FileListState createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  TextEditingController brpKali = TextEditingController();
  TextEditingController jumlahBrp = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int? hasilIdPrint = 0;

  int? result = 0, num1 = 0, num2 = 0;
  int? hasilTotal = 0;

  add() {
    setState(() {
      num1 = int.parse(brpKali.text);
      num2 = int.parse(jumlahBrp.text);
      result = num1! + num2!;
    });
  }

  List<String> items = [
    "A4 Hitam Putih",
    "A4 Warna",
    "F4 Warna",
    "F4 Hitam Putih",
    "Jilid"
  ];
  String? selectedItem = "A4 Hitam Putih";
  dynamic dropdownvalues = "menu one";

  List<dataPrint>? apiList;

  Future<void> getDataPrint() async {
    Uri url =
        Uri.parse("http://${Url.URL_API}/project_mobile/getDataBarang.php");
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

  Future<void> _uploadFile() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/transaksi/uploadAwal.php");
    var response = await http.post(url, body: {
      "tanggal": DateTime.now().toString(),
      "file": "-",
      "id_print": "$hasilIdPrint",
      "berapa_kali_print": brpKali.text,
      "jumlah_kertas": jumlahBrp.text,
      "total_harga": "$hasilTotal",
      "status": "pending",
    });
    var data = jsonDecode(response.body);
    if (data == "gagal") {
      Fluttertoast.showToast(
          msg: "gagal! cek kembali",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else
      Fluttertoast.showToast(
          msg: "berhasil",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Pembyaran()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Selected Files',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: widget.files.length,
        itemBuilder: (context, index) {
          final file = widget.files[index];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildFile(file),
                  SizedBox(height: 20),
                  Text(
                    "Pilih Jenis kertas",
                    style: GoogleFonts.openSans(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        "Lihat Jenis kertas",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        showBottomSheet(
                            backgroundColor: Colors.grey[800],
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30,
                                      ),
                                      if (apiList != null) getPrint(),
                                      ElevatedButton(
                                        child: const Text("tutup"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      selectedItem = item;
                    }),
                  ),
                  SizedBox(height: 34),
                  Text(
                    "Berapa Kali Print",
                    style: GoogleFonts.openSans(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: TextFormField(
                      controller: brpKali,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Masukan Jumlah yang benar";
                        } else {
                          return null;
                        }
                      },
                      decoration: ThemeHelper().textInputDecoration(
                          'Jumlah Berapa Kali Print',
                          'Masukan Berapa Kali Print'),
                    ),
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  ),
                  SizedBox(height: 34),
                  Text(
                    "Jumlah Halaman Pada File",
                    style: GoogleFonts.openSans(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: TextFormField(
                      controller: jumlahBrp,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Masukan Jumlah yang benar";
                        } else {
                          return null;
                        }
                      },
                      // controller: user,
                      decoration: ThemeHelper().textInputDecoration(
                          'Jumlah Berapa Halaman', 'Masukan Berapa Halaman'),
                    ),
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  ),
                  SizedBox(height: 34),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "TOTAL :",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          " $hasilTotal",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 34),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'Lanjut'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () async {
                        add();
                        switch (selectedItem) {
                          case "A4 Hitam Putih":
                            {
                              hasilTotal = result! * 500;
                              hasilIdPrint = 1;
                              showBottomSheet(
                                  backgroundColor: Colors.grey[800],
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              "Total Anda Adalah :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "$hasilTotal",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll<
                                                                  Color>(
                                                              Colors.green)),
                                                  child: const Text("Lanjut"),
                                                  onPressed: () {
                                                    _uploadFile();
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: const Text("tutup"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            break;
                          case "A4 Warna":
                            {
                              hasilTotal = result! * 1000;
                              hasilIdPrint = 2;
                              showBottomSheet(
                                  backgroundColor: Colors.grey[800],
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              "Total Anda Adalah :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "$hasilTotal",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll<
                                                                  Color>(
                                                              Colors.green)),
                                                  child: const Text("Lanjut"),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Pembyaran()));
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: const Text("tutup"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            break;
                          case "F4 Warna":
                            {
                              hasilTotal = result! * 1000;
                              hasilIdPrint = 4;
                              showBottomSheet(
                                  backgroundColor: Colors.grey[800],
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              "Total Anda Adalah :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "$hasilTotal",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll<
                                                                  Color>(
                                                              Colors.green)),
                                                  child: const Text("Lanjut"),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Pembyaran()));
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: const Text("tutup"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            break;
                          case "F4 Hitam Putih":
                            {
                              hasilTotal = result! * 500;
                              hasilIdPrint = 3;
                              showBottomSheet(
                                  backgroundColor: Colors.grey[800],
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              "Total Anda Adalah :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "$hasilTotal",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll<
                                                                  Color>(
                                                              Colors.green)),
                                                  child: const Text("Lanjut"),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Pembyaran()));
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: const Text("tutup"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            break;
                          case "Jilid":
                            {
                              hasilTotal = result! * 2500;
                              hasilIdPrint = 5;
                              showBottomSheet(
                                  backgroundColor: Colors.grey[800],
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              "Total Anda Adalah :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "$hasilTotal",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll<
                                                                  Color>(
                                                              Colors.green)),
                                                  child: const Text("Lanjut"),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Pembyaran()));
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: const Text("tutup"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            break;
                          default:
                            {
                              hasilTotal = 0;
                            }
                        }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Pembyaran()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () => widget.onOpenedFile(file),
      child: ListTile(
        leading: (file.extension == 'jpg' || file.extension == 'png')
            ? Image.file(
                File(file.path.toString()),
                width: 80,
                height: 80,
              )
            : Container(
                width: 80,
                height: 80,
              ),
        title: Text('${file.name}'),
        subtitle: Text('${file.extension}'),
        trailing: Text(
          '$size',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget getPrint() {
    return Expanded(
      child: ListView.builder(
          itemCount: apiList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${apiList![index].jenisPrint}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${apiList![index].harga}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            );
          }),
    );
  }
}
