import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String Name, Useremail;
  bool isSignedIn = false;

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      setState(() {
        Useremail = firebaseUser.email;
        // Name = firebaseUser.displayName;
        this.isSignedIn = true;
      });
    }
    Useremail = firebaseUser.email;
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: !isSignedIn
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: Text(
                          '${Useremail[0].toUpperCase()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          '$Useremail',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                        color: AppTheme.primarycolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)),
                        onPressed: () {
                          _auth.signOut();
                        },
                        child: Text('Sign Out',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
