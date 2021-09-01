import 'package:flutter/material.dart';
import 'package:upwork/loginpage.dart';
import 'package:upwork/navbar.dart';



class Profile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){

            Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (BuildContext context) => Login()));

          },
          child: Text('Profile page is here '),
        ),
      ),
    );
  }
}