import 'package:flutter/material.dart';
import 'package:upwork/navbar.dart';
import 'package:upwork/new%20navbar%20.dart';
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
                    builder: (BuildContext context) => AppHome(pageIndex: 1))

            );
          },
          child: Text('Settings page is here '),
        ),
      ),
    );
  }
}