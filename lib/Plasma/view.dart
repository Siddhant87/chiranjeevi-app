import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'contact.dart';
import 'package:url_launcher/url_launcher.dart';

class view extends StatefulWidget {
  final String id;
  view(this.id);
  @override
  _viewState createState() => _viewState(id);
}

class _viewState extends State<view> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  String id;
  _viewState(this.id);
  Contact _contact;
  bool isLoading = true;

  getContact(id) async {
    _databaseReference.child(id).onValue.listen((event) {
      setState(() {
        _contact = Contact.fromSnapshot(event.snapshot);
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.getContact(id);
  }

  callAction(String number) async {
    String url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not call $number';
    }
  }

  smsAction(String number) async {
    String url = 'sms:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send sms to $number';
    }
  }

  deleteContact() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete?"),
            content: Text("Delete Contact?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Delete"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  await _databaseReference.child(id).remove();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View'),
      ),
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.perm_identity),
                            Container(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Text(
                                  "${_contact.name}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.person),
                            Container(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Fathers Name',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Text(
                                  "${_contact.fatherName}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone),
                            Container(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Phone Number',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Text(
                                  "${_contact.phone}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.home),
                            Container(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Address',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Text(
                                  _contact.address,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.upcoming),
                            Container(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Age',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Text(
                                  _contact.age,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.male),
                            Container(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Gender',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Text(
                                  _contact.gender,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.bloodtype),
                            Container(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Blood Group',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Text(
                                  _contact.bloodGroup,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.phone),
                              color: Colors.red,
                              onPressed: () {
                                callAction(_contact.phone);
                              },
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.message),
                              color: Colors.red,
                              onPressed: () {
                                smsAction(_contact.phone);
                              },
                            )
                          ],
                        )),
                  ),
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.edit),
                              color: Colors.red,
                              onPressed: () {
                                // navigateToEditScreen(id);
                              },
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                deleteContact();
                              },
                            )
                          ],
                        )),
                  )
                ],
              ),
      ),
    );
  }
}
