import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'addScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'Plasma/view.dart';
import 'Oxygen/oview.dart';
import 'Medicine/mview.dart';

class Availabilities extends StatefulWidget {
  @override
  _AvailabilitiesState createState() => _AvailabilitiesState();
}

class _AvailabilitiesState extends State<Availabilities> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  navigateToPlasmaViewScreen(id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return view(id);
    }));
  }

  navigateToOxygenViewScreen(id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return oview(id);
    }));
  }

  navigateToMedicineViewScreen(id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return mview(id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: TabBar(tabs: <Widget>[
          Tab(
            text: 'Plasma',
          ),
          Tab(
            text: 'Oxygen',
          ),
          Tab(
            text: 'Medicinal support',
          )
        ])),
        body: TabBarView(children: <Widget>[
          Container(
            child: FirebaseAnimatedList(
              query: _databaseReference,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return GestureDetector(
                  onTap: () {
                    navigateToPlasmaViewScreen(snapshot.key);
                  },
                  child: snapshot.value['bloodGroup'] == null
                      ? Text('')
                      : Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        " Name : ${snapshot.value['name']} ",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        " Blood Group : ${snapshot.value['bloodGroup']} ",
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                );
              },
            ),
          ),
          Container(
            child: FirebaseAnimatedList(
              query: _databaseReference,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return GestureDetector(
                  onTap: () {
                    navigateToOxygenViewScreen(snapshot.key);
                  },
                  child: snapshot.value['oxygen'] == null
                      ? Text('', style: TextStyle(fontSize: 0))
                      : Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        " Name : ${snapshot.value['name']} ",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        " Oxygen quantity : ${snapshot.value['oxygen']} ",
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                );
              },
            ),
          ),
          Container(
            child: FirebaseAnimatedList(
              query: _databaseReference,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return GestureDetector(
                  onTap: () {
                    navigateToMedicineViewScreen(snapshot.key);
                  },
                  child: snapshot.value['medicine'] == null
                      ? Text('', style: TextStyle(fontSize: 0))
                      : Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        " Name : ${snapshot.value['name']} ",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        " Medicine Name : ${snapshot.value['medicine']} ",
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                );
              },
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.primarycolor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return addScreen();
            }));
          },
        ),
      ),
    );
  }
}
