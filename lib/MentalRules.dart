import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'data/user_data.dart';

class MentalRules extends StatefulWidget {
  @override
  _MentalRulesState createState() => _MentalRulesState();
}

class _MentalRulesState extends State<MentalRules> {
  String currentLang = 'en';

  TextStyle heading = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle body = TextStyle(fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mental Health guidlines',
          style: TextStyle(color: Colors.white),
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
        child: ListView(
          padding: EdgeInsets.all(20),
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
            SizedBox(height: 10),
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
            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
