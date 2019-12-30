import 'package:flutter/material.dart';
import 'constants.dart';



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
          size: iconSize,
        ),
        SizedBox(
          height: spaceBetween,
        ),
        Text(
          text,
          style: labelTextStyle,
        ),
      ],
    );
  }
}