import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.arrow_back,
                        size: 20.0, color: Colors.purpleAccent[700]),
                    Text('P R O F I L E',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.purpleAccent[700])),
                    Icon(Icons.settings,
                        size: 20.0, color: Colors.purpleAccent[700]),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 65,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person_outline_rounded),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 500,
              color: Colors.transparent,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: buildTitle(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Profile Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.purpleAccent[700],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Nama Lengkap'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Alamat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'No Hp'),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Edit Profile'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.purpleAccent[900],
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ],
      );
}
