import 'package:flutter/material.dart';
import 'package:upwork/navbar.dart';
import 'package:upwork/prodile.dart';

import 'loginpage.dart';



class Settings extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            // Navigator.pushNamed(
            //   context,
            //   NextScreen.route,
            //   arguments: NextScreenArgs("pew"),
            // );

            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => Navbar(index: 1))

            );
          },
          child: Text('Settings page is here '),
        ),
      ),
    );
  }
}