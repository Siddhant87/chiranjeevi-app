import 'package:app/data/user_data.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'data/user_data.dart';

class HomeRules extends StatefulWidget {
  @override
  _HomeRulesState createState() => _HomeRulesState();
}

class _HomeRulesState extends State<HomeRules> {
  String currentLang = 'en';

  TextStyle heading = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle body = TextStyle(fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home quarantine guidlines',
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
              Constants.text1[currentLang],
              style: heading,
            ),
            SizedBox(height: 10),
            Text(
              Constants.text2[currentLang],
              style: body,
            ),
            SizedBox(height: 10),
            Image(
              image: AssetImage(
                'images/Talk_to_friends.png',
              ),
            ),
            SizedBox(height: 10),
            Text(
              Constants.text3[currentLang],
              style: heading,
            ),
            SizedBox(height: 10),
            Text(
              Constants.text4[currentLang],
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
              Constants.text5[currentLang],
              style: heading,
            ),
            SizedBox(height: 10),
            Text(
              Constants.text6[currentLang],
              style: body,
            ),
            SizedBox(height: 10),
            Container(
              height: 20,
            ),
            SizedBox(height: 10),
            Text(
              Constants.text7[currentLang],
              style: heading,
            ),
            SizedBox(height: 10),
            Text(
              Constants.text8[currentLang],
              style: body,
            ),
            SizedBox(height: 10),
            Image(
              image: AssetImage(
                'images/Make_Routine.png',
              ),
            ),
            SizedBox(height: 10),
            Text(
              Constants.text9[currentLang],
              style: heading,
            ),
            SizedBox(height: 10),
            Text(
              Constants.text10[currentLang],
              style: body,
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
