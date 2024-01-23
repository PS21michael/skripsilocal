import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../components/button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage('assets/desktop-wallpaper-abstract-square-blue-aesthetic-square-thumbnail.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )
                      ),
                      child: Icon(
                        LineAwesomeIcons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Hi, Username',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              itemCard('Username', 'Try11222', CupertinoIcons.person_alt_circle_fill),
              SizedBox(height: 20),
              itemCard('Nama Lengkap', 'Bob', CupertinoIcons.person),
              SizedBox(height: 20),
              itemCard('Provinsi Tempat Tinggal', 'Jakarta', CupertinoIcons.home),
              SizedBox(height: 20),
              itemCard('Tanggal Lahir', '11-4-2002', CupertinoIcons.calendar),
              SizedBox(height: 20),
              theButton(
                text: 'Edit Profile',
                onTap: (){

                },
              ),
              SizedBox(height: 10),
              const Divider(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ListTile(
                  // onTap: ,
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )
                    ),
                    child: Icon(
                      LineAwesomeIcons.alternate_sign_out,
                    ),
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

itemCard(String title, String subtitle, IconData){
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text (subtitle),
        leading: Icon(IconData),
      ),
    ),
  );
}
