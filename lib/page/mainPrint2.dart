import 'dart:convert';
import 'dart:io';
import 'package:app_pron/bottNav.dart';
import 'package:app_pron/pages_index/dataPrint.dart';
import 'package:app_pron/pages_index/theme_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_pron/url.dart';
import 'package:http/http.dart' as http;
import 'package:app_pron/pages_index/fileList.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPrint2 extends StatefulWidget {
  const MyPrint2({Key? key}) : super(key: key);
  @override
  _MyPrint2State createState() => _MyPrint2State();
}

class _MyPrint2State extends State<MyPrint2> {
  TextEditingController brpKali = TextEditingController();
  TextEditingController jumlahBrp = TextEditingController();

  List<String> items = [
    "A4 Hitam Putih",
    "A4 Warna",
    "F4 Warna",
    "F4 Hitam Putih",
    "Jilid"
  ];
  String? selectedItem = "A4 Hitam Putih";
  int? hasilIdPrint = 0;

  int? result1 = 0, num1 = 0, num2 = 0;
  int? hasilTotal = 0;

  add() {
    setState(() {
      num1 = int.parse(brpKali.text);
      num2 = int.parse(jumlahBrp.text);
      result1 = num1! + num2!;
    });
  }

  List<dataPrint>? apiList;

  String idUser = "";

  Future getIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = (prefs.getString('id_user') ?? "");
    });
  }

  Future<void> getDataPrint() async {
    Uri url =
        Uri.parse("http://${Url.URL_API}/project_mobile/getDataBarang.php");
    var respone = await http.get(url);

    apiList = jsonDecode(respone.body)
        .map((item) => dataPrint.fromJson(item))
        .toList()
        .cast<dataPrint>();
  }

  Future<void> _uploadAwal() async {
    Uri url = Uri.parse(
        "http://${Url.URL_API}/project_mobile/transaksi/uploadAwal.php");
    var response = await http.post(url, body: {
      "tanggal": DateTime.now().toString(),
      "file": "$namePrint",
      "id_print": "$hasilIdPrint",
      "berapa_kali_print": brpKali.text,
      "jumlah_kertas": jumlahBrp.text,
      "total_harga": "$hasilTotal",
      "status": "pending",
      "id_user": idUser.toString(),
      "bukti_pembayaran": "$namaBukti"
    });
    var data = jsonDecode(response.body);
    if (data == "gagal") {
      Fluttertoast.showToast(
          msg: "gagal! cek kembali",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "berhasil",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }
  }

  final picker = ImagePicker();
  var urlBukti;
  var namaBukti;
  Future pilihBukti() async {
    var result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      print(result.name);
      print(result.path);
      setState(() {
        urlBukti = result.path;
        namaBukti = result.name;
      });
    } else {}
  }

  var urlPrint;
  var namePrint;
  Future pilihPrint() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'png', 'pdf', 'doc']);
    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.extension);
      print(file.size);
      print(file.path);
      setState(() {
        urlPrint = file.path;
        namePrint = file.name;
      });
    } else {}
  }

  Future saveBukti() async {
    final uri = Uri.parse(
        "http://${Url.URL_API}/project_mobile/transaksi/uploadBukti.php");
    var request = http.MultipartRequest('POST', uri);
    var uploadBukti = await http.MultipartFile.fromPath('image', urlBukti);
    request.files.add(uploadBukti);
    var response = await request.send();
    if (response.statusCode == 200) {
      print(response.reasonPhrase);
    }
  }

  Future savePrint() async {
    final uri = Uri.parse(
        "http://${Url.URL_API}/project_mobile/transaksi/uploadPrint.php");
    var request = http.MultipartRequest('POST', uri);
    var uploadFile = await http.MultipartFile.fromPath('file', urlPrint);
    request.files.add(uploadFile);
    var response = await request.send();
    if (response.statusCode == 200) {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataPrint();
    getIdUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PRON PRINT",
          style: GoogleFonts.openSans(
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => kumNav()));
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Upload your file',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'File harus berupa jpg , png , pdf dan doc',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  pilihPrint();
                },
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10),
                      dashPattern: [10, 4],
                      strokeCap: StrokeCap.round,
                      color: Colors.purple.shade400,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade50.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.folder_open,
                              color: Colors.purple,
                              size: 40,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Select your file',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Center(
                child: Text(urlPrint != null ? urlPrint : "*Tidak ada File*"),
              ),
              SizedBox(height: 10),
              Text(
                "PIlih Jenis Kertas",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: DropdownButtonFormField<String>(
                  alignment: AlignmentDirectional.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
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
              ),
              SizedBox(height: 34),
              Text(
                "Berapa Kali Print",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: brpKali,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
              ),
              SizedBox(height: 34),
              Text(
                "Jumlah Halaman Pada File",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: jumlahBrp,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                          hasilTotal = result1! * 500;
                          hasilIdPrint = 1;
                          _showModalBottomSheet(context);
                        }
                        break;
                      case "A4 Warna":
                        {
                          hasilTotal = result1! * 1000;
                          hasilIdPrint = 2;
                          _showModalBottomSheet(context);
                        }
                        break;
                      case "F4 Warna":
                        {
                          hasilTotal = result1 = 1000;
                          hasilIdPrint = 4;
                          _showModalBottomSheet(context);
                        }
                        break;
                      case "F4 Hitam Putih":
                        {
                          hasilTotal = result1! * 500;
                          hasilIdPrint = 3;
                          _showModalBottomSheet(context);
                        }
                        break;
                      case "Jilid":
                        {
                          hasilTotal = result1! * 2500;
                          hasilIdPrint = 5;
                          _showModalBottomSheet(context);
                        }
                        break;
                      default:
                        {
                          hasilTotal = 0;
                        }
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.4,
              maxChildSize: 0.9,
              minChildSize: 0.32,
              builder: (context, scrollController) => SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Total Anda Adalah :",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        "$hasilTotal",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Silahkan Bayar Terlebih Dahulu",
                        style: GoogleFonts.openSans(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      Text(
                        "Gopay/Dana",
                        style: GoogleFonts.openSans(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                      Text(
                        "081216512283",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        padding: EdgeInsets.all(32),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: Text("Upload Bukti Pembayaran"),
                          onPressed: () {
                            pilihBukti();
                          },
                        ),
                      ),
                      Text(urlBukti != null ? urlBukti : "*Tidak ada File*"),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.green)),
                            child: const Text("Lanjut"),
                            onPressed: () async {
                              if (urlBukti != null) {
                                saveBukti();
                                _uploadAwal();
                                savePrint();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => kumNav()));
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Upload Bukti Pembayaran Terlebih dahulu",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white);
                              }
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
                  )),
            ));
  }
}
