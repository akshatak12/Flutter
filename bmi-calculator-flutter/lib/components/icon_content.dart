import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';



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
          size: kIconSize,
        ),
        SizedBox(
          height: kSpaceBetween,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}