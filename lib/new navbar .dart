import 'package:flutter/material.dart';
import 'package:upwork/prodile.dart';
import 'package:upwork/settings.dart';

import 'loginpage.dart';
// ignore: must_be_immutable
class AppHome extends StatefulWidget {
  int pageIndex;
  AppHome({this.pageIndex = 0});

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int selectedIndex = 0;
  DateTime lastPressed;

  final PageController pageController = PageController();

  // final authenticatedScreens = [
  //   HomePage(),
  //   SearchPage(),
  //   CoursesPage(),
  //   ProfilePage(),
  // ];
  //
  // final unAuthenticatedScreens = [
  //   HomePage(),
  //   SearchPage(),
  //   CoursesPage(),
  //   SignIn(),
  // ];


  @override
  void initState() {
    selectedIndex = widget.pageIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients) {
        pageController.animateToPage(widget.pageIndex, duration: Duration(milliseconds: 1), curve: Curves.easeInOut);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final maxDuration = Duration(seconds: 2);
        final isWarning = lastPressed == null || now.difference(lastPressed) > maxDuration;

        if (isWarning) {
          lastPressed = DateTime.now();

          final snackBar = SnackBar(
            content: Text("Tap again to exit"),
            duration: maxDuration,
          );

          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(snackBar);

          return false;
        } else {
          return true;
        }
      },
      child: StreamBuilder(
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                    color: Colors.black,
                  ),
                );
              }
            }
            final  user = snapshot.data;
            return user == null
                ? Container(
              child: Scaffold(
                bottomNavigationBar: buildUnAuthenticatedBottomNavigationBar(context),
                // body: SafeArea(child: unAuthenticatedScreens[selectedIndex]),
                body: SafeArea(
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Login(),
                      Profile(),
                      Settings(),

                    ],
                  ),
                ),
              ),
            )
                : Container(
              child: Scaffold(
                bottomNavigationBar: buildAuthenticatedBottomNavigationBar(context),
                // body: SafeArea(child: authenticatedScreens[selectedIndex]),
                body: SafeArea(
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Login(),
                      Profile(),
                      Settings(),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  BottomNavigationBar buildAuthenticatedBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.pageIndex,
      // onTap: (index) => setState(() => selectedIndex = index),
      onTap: bottomNavBarTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).iconTheme.color,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).iconTheme.color.withOpacity(0.4),
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).iconTheme.color,
      unselectedItemColor: Theme.of(context).iconTheme.color.withOpacity(0.4),
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(
            Icons.search,
          ),
        ),
        BottomNavigationBarItem(
          label: "Courses",
          icon: Icon(
            Icons.auto_stories_outlined,
          ),
          activeIcon: Icon(
            Icons.auto_stories,
          ),
        ),
        BottomNavigationBarItem(
          label: "Account",
          icon: Icon(
            Icons.person,
          ),
        ),
      ],
    );
  }

  BottomNavigationBar buildUnAuthenticatedBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.pageIndex,
      // onTap: (index) => setState(() => selectedIndex = index),
      onTap: bottomNavBarTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).iconTheme.color,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).iconTheme.color.withOpacity(0.4),
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).iconTheme.color,
      unselectedItemColor: Theme.of(context).iconTheme.color.withOpacity(0.4),
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(
            Icons.search,
          ),
        ),
        BottomNavigationBarItem(
          label: "Courses",
          icon: Icon(
            Icons.auto_stories_outlined,
          ),
          activeIcon: Icon(
            Icons.auto_stories,
          ),
        ),
        BottomNavigationBarItem(
          label: "Account",
          icon: Icon(
            Icons.person,
          ),
        ),
      ],
    );
  }

  void bottomNavBarTapped(int value) {
    // widget.pageIndex = value;
    // selectedIndex = widget.pageIndex as int;
    setState(() {
      widget.pageIndex = value;
      selectedIndex = widget.pageIndex;
      pageController.jumpToPage(widget.pageIndex);
    });
  }
}
