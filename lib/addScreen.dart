import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'Plasma/add.dart';
import 'Oxygen/oadd.dart';
import 'Medicine/madd.dart';

class addScreen extends StatefulWidget {
  @override
  _addScreenState createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Field'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Container(
                    width: 500,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      color: AppTheme.primarycolor,
                      child: Text(
                        'Plasma',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return add();
                        }));
                      },
                    )),
                Container(
                    width: 500,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      color: AppTheme.primarycolor,
                      child: Text(
                        'Oxygen',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return oadd();
                        }));
                      },
                    )),
                Container(
                    width: 500,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      color: AppTheme.primarycolor,
                      child: Text(
                        'Medicinal supply',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return madd();
                        }));
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
