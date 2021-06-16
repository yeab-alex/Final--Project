import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget {
  final textstyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Any thing you like",
              style: textstyle,
            ),
          ],
        ),
      ],
    ));
  }
}
