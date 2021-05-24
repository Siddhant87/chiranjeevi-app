import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'contact.dart';

class oadd extends StatefulWidget {
  @override
  _oaddState createState() => _oaddState();
}

class _oaddState extends State<oadd> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  String _name = '';
  String _fatherName = '';
  String _phone = '';
  String _address = '';
  String _age = '';
  String _gender = '';
  String _oxygen = '';

  saveContact() async {
    if (_name.isNotEmpty &&
        _fatherName.isNotEmpty &&
        _phone.isNotEmpty &&
        _address.isNotEmpty &&
        _age.isNotEmpty &&
        _gender.isNotEmpty &&
        _oxygen.isNotEmpty) {
      Contact contact = Contact(this._name, this._fatherName, this._phone,
          this._address, this._age, this._gender, this._oxygen);

      await _databaseReference.push().set(contact.toJson());
      Navigator.of(context).pop();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Field required"),
              content: Text("All fields are required"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _fatherName = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Father Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _phone = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _oxygen = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'oxygen Quanitity in kgs',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                onPressed: () {
                  saveContact();
                },
                color: AppTheme.primarycolor,
                child: Text("Save",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
