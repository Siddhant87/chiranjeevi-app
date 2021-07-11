import 'package:app/data/user_data.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonSymptoms extends StatefulWidget {
  @override
  _CommonSymptomsState createState() => _CommonSymptomsState();
}

class _CommonSymptomsState extends State<CommonSymptoms> {
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
                Constants.mtext1[currentLang],
                style: heading,
              ),
              SizedBox(height: 10),
              Text(
                Constants.mtext2[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Text(
                Constants.mtext3[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage(
                  'images/Exercise_Daily.png',
                ),
              ),
            ],
          ),
        ));
  }
}
