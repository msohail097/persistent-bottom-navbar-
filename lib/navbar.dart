import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upwork/prodile.dart';
import 'package:upwork/settings.dart';


import 'colors.dart';
import 'loginpage.dart';


class Navbar extends StatefulWidget {
   int index;

   Navbar({Key key, this.index}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<Navbar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex=widget.index;


    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(_pageController.hasClients){
        _pageController.animateToPage(widget.index, duration: Duration(milliseconds: 1), curve: Curves.easeInOut);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),
          ),

          child: BottomNavigationBar(
            unselectedItemColor: AppColors.kGrey,
            //backgroundColor: Colors.white10,
            //showSelectedLabels: true,
            //showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon:  Icon(Icons.home,size: 30.0,),
                  //activeIcon: new Image.asset("assets/profilefilled.png",height: 32,width: 32,),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Home', style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ))),
                  )),
              BottomNavigationBarItem(icon: Icon(Icons.people,size: 30.0,),
                  //activeIcon: new Image.asset("assets/homefilled.png",height: 32,width: 32,),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Profile', style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ))),
                  )),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.settings,size: 30.0,),
                  //activeIcon: new Image.asset("assets/message.png",height: 32,width: 32,),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Settings', style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ))),
                  )),

            ],
            onTap: _onTappedBar,
            selectedItemColor: AppColors.kGreen,
            currentIndex: _selectedIndex,

          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics:NeverScrollableScrollPhysics(),
        children: <Widget>[

        Login(),
        Profile(),
          Settings(),

        ],
      ),
    );
  }

  void _onTappedBar(int value) {
    widget.index=value;
      _selectedIndex = widget.index;
      setState(() {
        _pageController.jumpToPage(widget.index);
      });


  }


}