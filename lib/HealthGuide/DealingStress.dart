import 'package:app/data/user_data.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DealingStress extends StatefulWidget {
  @override
  _DealingStressState createState() => _DealingStressState();
}

class _DealingStressState extends State<DealingStress> {
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
                Constants.mtext4[currentLang],
                style: heading,
              ),
              SizedBox(height: 10),
              Text(
                Constants.mtext5[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Text(
                Constants.mtext6[currentLang],
                style: body,
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage(
                  'images/Healthy_Diet.png',
                ),
              ),
              SizedBox(height: 10),
              Text(
                Constants.mtext7[currentLang],
                style: heading,
              ),
            ],
          ),
        ));
  }
}
