import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/svg.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;
  FirebaseUser user;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
        showToast();
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  navigateToSignupScreen() {
    Navigator.pushReplacementNamed(context, "/SignupPage");
  }

  showToast() {
    Fluttertoast.showToast(
        msg: "$_email signed in successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  signin() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('images/login_top.png'),
            width: size.width * 0.3,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'images/login_bottom.png',
              width: size.width * 0.4,
            ),
          ),
          Container(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 200,
                  child: SvgPicture.asset(
                    'images/login.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Use your Email and Password or Create an account',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Provide an email';
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: AppTheme.primarycolor,
                                ),
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                            onSaved: (input) => _email = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            validator: (input) {
                              if (input.length < 6) {
                                return 'Password should be 6 char atleast';
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: AppTheme.primarycolor,
                                ),
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                            onSaved: (input) => _password = input,
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                          child: RaisedButton(
                            padding:
                                EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                            color: AppTheme.primarycolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            onPressed: signin,
                            child: Text('Sign In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: navigateToSignupScreen,
                            child: Text('Create an account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
