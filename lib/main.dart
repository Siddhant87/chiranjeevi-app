import 'package:app/splashScreen.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SigninPage.dart';
import 'SignupPage.dart';
import 'ProfilePage.dart';
import 'Availabilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primaryColor: AppTheme.primarycolor,
      ),
      home: SplashScreen(),
      routes: {
        "/SigninPage": (context) => SigninPage(),
        "/SignupPage": (context) => SignupPage(),
        "/ProfilePage": (context) => ProfilePage(),
        "/Availabilities": (context) => Availabilities(),
      },
    );
  }
}
