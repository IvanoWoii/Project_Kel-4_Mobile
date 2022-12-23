import 'dart:convert';
import 'dart:io';
import 'package:app_pron/bottNav.dart';
import 'package:app_pron/bottNav.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:app_pron/pages_index/fileList.dart';


class MyPrint2 extends StatefulWidget {
  const MyPrint2({Key? key}) : super(key: key);
  @override
  _MyPrint2State createState() => _MyPrint2State();
}

class _MyPrint2State extends State<MyPrint2> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'MultipleFile'];
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => kumNav()));
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
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
                  'File should be jpg, png, pdf, docx',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                pickFiles();
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
            // if (file != null) fileDetails(file!),
            // if (file != null)
            //   ElevatedButton(
            //     onPressed: () {
            //       viewFile(file!);
            //     },
            //     child: Text('View Selected File'),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
          Text('File Extension: ${file.extension}'),
          Text('File Path: ${file.path}'),
        ],
      ),
    );
  }

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    loadSelectedFiles(result!.files);
    setState(() {
      
    });
  }

  // multiple file selected
  // navigate user to 2nd screen to show selected files
  void loadSelectedFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FileList(files: files, onOpenedFile: viewFile)));
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
