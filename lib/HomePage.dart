import 'package:app/splashScreen.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ProfilePage.dart';
import 'Availabilities.dart';
import 'homescreen/HomeRules.dart';
import 'dart:async';
import 'HealthGuide/MentalRules.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var user;
  bool isSignedIn = false;

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeRules(),
    MentalRules(),
    Availabilities(),
    ProfilePage(),
  ];

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, "/SigninPage");
      }
    });
  }

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isSignedIn = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Covid Helpcare'),
        // ),
        body: !isSignedIn
            ? CircularProgressIndicator()
            : _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          backgroundColor: AppTheme.primarycolor,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Health guide',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_outlined),
              label: 'Availibilities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
