import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat')),
      body: Center(
        child: Text('Riwayat Screen', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}