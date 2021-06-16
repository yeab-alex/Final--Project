import 'package:flutter/material.dart';
import 'package:project/src/screens/main_screen.dart';
import '../app.dart';
import '../pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:email_validator/email_validator.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  bool _toggleVisibility = true;
  //Email text fild and password text fild
  Widget _buildEmailTextFild() {
    return TextFormField(
      onChanged: (value) {
        email = value.trim();
        // assert(EmailValidator.validate(email));
      },
      decoration: InputDecoration(
          hintText: "Your email ",
          hintStyle: TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 18.0,
          )),
    );
  }

  Widget _buildPasswordTextFild() {
    return TextFormField(
      onChanged: (value) {
        password = value.trim();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign In",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              //forgotten passward
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Forgotten Password?",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffF8BA50),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      _buildEmailTextFild(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildPasswordTextFild()
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
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MainScreen()));
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
                    "Don't have an account?",
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => SignUpPage()));
                    },
                    child: Text(
                      "Sign up",
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
  }
}
