import 'package:app/HealthGuide/CommonSymptoms.dart';
import 'package:app/HealthGuide/DealingStress.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MentalRules extends StatefulWidget {
  @override
  _MentalRulesState createState() => _MentalRulesState();
}

class _MentalRulesState extends State<MentalRules> {
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
                        'images/coronadr.svg',
                        alignment: Alignment.topCenter,
                        width: 150,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 220,
                      child: Text(
                        "Get to know\nAbout Covid-19",
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
                    'Common Symptoms',
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
                      pageBuilder: (context, _, __) => CommonSymptoms(),
                    ),
                  );
                });
              },
            ),
            SizedBox(
              height: 20,
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
                    'Dealing with Stress',
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
                      pageBuilder: (context, _, __) => DealingStress(),
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
