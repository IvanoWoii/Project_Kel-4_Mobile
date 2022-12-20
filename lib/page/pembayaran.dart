import 'dart:io';

import 'package:app_pron/home.dart';
import 'package:app_pron/pages_index/theme_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:app_pron/pages_index/fileList.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

class Pembyaran extends StatefulWidget {
  const Pembyaran({super.key});

  @override
  State<Pembyaran> createState() => _PembyaranState();
}

class _PembyaranState extends State<Pembyaran> {
  PlatformFile? pickedFile;

  Future SelectedFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pembayaran"),
        backgroundColor: Colors.purple,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Pembayaran melalui Dana/Gopay",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "081216512283",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 140),
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Upload Bukit pembayaran",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 25),
                        if (pickedFile != null)
                          Container(
                            width: 150,
                            height: 150,
                            child: Center(
                              child: Image.file(
                                File(pickedFile!.path!),
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 400),
                          padding: EdgeInsets.all(32),
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            child: Text("Upload Bukti Pembayaran"),
                            onPressed: () async {
                              SelectedFile();
                            },
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'BAYAR'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pembyaran()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openFiles(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
