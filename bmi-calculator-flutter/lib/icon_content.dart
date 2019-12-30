import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({this.icon, this.text});

  final icon;
  final text;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            icon,
          size: 70,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}