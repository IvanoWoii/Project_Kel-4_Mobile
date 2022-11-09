import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(250, 175, 1, 113),
        centerTitle: true,
        title: const Text(
          'Profile',
          style:
              TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                Icons.settings,
                size: 20,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(110.0),
            child: Container(
              padding: const EdgeInsets.only(left: 30, bottom: 20),
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person_outline_rounded),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.deepPurple,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'user123456',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          'user123456@gmail.com',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '+62 812 3456 7890',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      body: Center(
        child: Text('Profile Screen', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}
