import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: Center(
        child: Text('Wishlist Screen', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}