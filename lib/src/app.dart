import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/src/pages/singin_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Gebeta Food Delivery App",
            theme: ThemeData(primaryColor: Color(0xffE94949)),
            routes: {
              "/": (BuildContext context) => SignInPage(),
            });
      },
    );
  }
}
