import 'package:app/ProfilePage.dart';
import 'package:app/data/user_data.dart';
import 'package:app/homescreen/Guidlines.dart';
import 'package:app/homescreen/Instructions.dart';
import 'package:app/homescreen/OtherInstructions.dart';
import 'package:app/theme/user_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Eligible.dart';
//import '../data/user_data.dart';

class HomeRules extends StatefulWidget {
  @override
  _HomeRulesState createState() => _HomeRulesState();
}

class _HomeRulesState extends State<HomeRules> {
  String Name, Useremail;
  int i;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      setState(() {
        Useremail = firebaseUser.email;
        Name = firebaseUser.displayName;
      });
    }
    Useremail = firebaseUser.email;

    for (i = 0; i < Useremail.length; i++) {
      if (Useremail[i] == '@' && Useremail != null)
        Useremail = (Useremail.substring(0, i)).toUpperCase();
    }
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  TextStyle heading = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle body = TextStyle(fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Cheeranjeevi',
          style: GoogleFonts.sacramento(
              textStyle: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
        ),
        backgroundColor: AppTheme.primarycolor,
      ),
      body: Container(
        child: ListView(
          //padding: EdgeInsets.all(20),
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [AppTheme.secondarycolor, AppTheme.primarycolor],
                  ),
                  image: DecorationImage(
                    image: AssetImage('images/virus.png'),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 100,
                      child: SvgPicture.asset(
                        'images/Drcorona.svg',
                        alignment: Alignment.topCenter,
                        width: 150,
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 200,
                      child: Text(
                        "All you need\nStay at home",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(offset: Offset(0, 4)
                      //blurRadius: 30,
                      //color: Colors.grey,
                      )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME\n$Useremail',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primarycolor,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppTheme.primarycolor,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  color: AppTheme.secondarycolor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(offset: Offset(0, 4))],
                ),
                child: Center(
                  child: Text(
                    'Who is Eligible for Home\nQuarantine',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => Eligible(),
                    ),
                  );
                });
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  color: AppTheme.secondarycolor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(offset: Offset(0, 4))],
                ),
                child: Center(
                  child: Text(
                    'Home Quarantine\nGuidlines',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => Guidlines(),
                    ),
                  );
                });
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  color: AppTheme.secondarycolor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(offset: Offset(0, 4))],
                ),
                child: Center(
                  child: Text(
                    'Instructions for care\ntaker',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => Instructions(),
                    ),
                  );
                });
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  color: AppTheme.secondarycolor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(offset: Offset(0, 4))],
                ),
                child: Center(
                  child: Text(
                    'Other Quarantine\n related Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => OtherInstructions(),
                    ),
                  );
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
