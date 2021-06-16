import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/src/app.dart';
import 'singin_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool _toggleVisibility = true;
  bool _toggleConfirmVisibility = true;
  //Email text field and password text field
  Widget _buildEmailTextFild() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        email = value;
      },
      decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
    );
  }

  Widget _buildusernameTextFild() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "username",
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
    );
  }

  Widget _buildPasswordTextFild() {
    return TextFormField(
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        //visibility icon
        suffixIcon: IconButton(
          color: Colors.grey,
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
    );
  }

  Widget _buildConfirmPasswordTextFild() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Comfirm Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        //visibility icon
        suffixIcon: IconButton(
          color: Colors.grey,
          onPressed: () {
            setState(() {
              _toggleConfirmVisibility = !_toggleConfirmVisibility;
            });
          },
          icon: _toggleConfirmVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleConfirmVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  //forgotten passward
                  SizedBox(
                    height: 50.0,
                  ),
                  Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildusernameTextFild(),
                          SizedBox(
                            height: 20.0,
                          ),
                          _buildEmailTextFild(),
                          SizedBox(
                            height: 20.0,
                          ),
                          _buildPasswordTextFild(),
                          SizedBox(
                            height: 20.0,
                          ),
                          _buildConfirmPasswordTextFild(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  //sign in container
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Color(0xffE94949),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: TextButton(
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => App()));
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Alredy have an account?",
                        style: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignInPage()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xffF8BA50),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}
