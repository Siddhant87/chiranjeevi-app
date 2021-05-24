import 'package:app/SigninPage.dart';
import 'package:app/theme/user_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;
  FirebaseUser _user;

  navigateToSigninScreen() {
    Navigator.pushReplacementNamed(context, "/SigninPage");
  }

  isEmailVerified() async {
    _user.reload();
    FirebaseUser user = await _auth.currentUser();

    if (user.isEmailVerified == true) {
      showToast();
      Navigator.pushReplacementNamed(context, "/");
    } else {
      showNotVerifyMessage();
    }
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

  signup() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        AuthResult result = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        _user = result.user;
        sendMailVerification();
      } catch (e) {
        showError(e.message);
      }
    }
  }

  sendMailVerification() async {
    try {
      _user.sendEmailVerification();
      showVerifyMessage();
    } catch (e) {
      showError(e.message);
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

  showVerifyMessage() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          isEmailVerified();
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text(
            "Verify your Email",
            style: TextStyle(
              color: Colors.orange,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "We have send you a verification email on $_email, Click verify when done",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                isEmailVerified();
              },
              child: Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }

  showNotVerifyMessage() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SigninPage(),
            ),
          );
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text(
            "Email not verified",
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Try again, we have send you a verification email on $_email, Click verify when done",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                isEmailVerified();
              },
              child: Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Sign up',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                child: Image(
                    image: AssetImage(
                      'images/sign_up.png',
                    ),
                    fit: BoxFit.fill),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                child: Center(
                  child: Text(
                    'Use your email to create an account',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide a name';
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          onSaved: (input) => _name = input,
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
                                color: Colors.black,
                              ),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
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
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
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
                          onPressed: signup,
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: navigateToSigninScreen,
                          child: Text('Already have an account?',
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
      ),
    );
  }
}
