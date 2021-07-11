import 'package:app/data/user_data.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Guidlines extends StatefulWidget {
  @override
  _GuidlinesState createState() => _GuidlinesState();
}

class _GuidlinesState extends State<Guidlines> {
  String currentLang = 'en';
  TextStyle heading = GoogleFonts.nunito(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ));
  TextStyle body = GoogleFonts.nunito(
      textStyle: TextStyle(
    fontSize: 15,
  ));

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
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.language),
              color: Colors.white,
              tooltip: 'Language',
              onPressed: () {
                setState(() {
                  currentLang = currentLang == "en" ? "hi" : "en";
                });
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Text(
                Constants.text3[currentLang],
                style: heading,
              ),
              SizedBox(height: 10),
              Text(
                Constants.text4_1[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage(
                  'images/mask.png',
                ),
              ),
              SizedBox(height: 10),
              Text(
                Constants.text4_2[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage(
                  'images/socialdistance.png',
                ),
              ),
              SizedBox(height: 10),
              Text(
                Constants.text4_3[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage(
                  'images/washhands.png',
                ),
              ),
              SizedBox(height: 10),
              Text(
                Constants.text4_4[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage(
                  'images/Fake_News.png',
                ),
              ),
              SizedBox(height: 10),
              Text(
                Constants.text4_1[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              // Image(
              //   image: AssetImage(
              //     'images/Fake_News.png',
              //   ),
              //),
            ],
          ),
        ));
  }
}
