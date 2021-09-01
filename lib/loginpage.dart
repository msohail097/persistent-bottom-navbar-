import 'package:flutter/material.dart';
import 'package:upwork/navbar.dart';



class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Navbar();

          },
          child: Text('Hello! I am login page '),
        ),
      ),
    );
  }
}