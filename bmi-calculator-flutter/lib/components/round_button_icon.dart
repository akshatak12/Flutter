import 'package:flutter/material.dart';

class RoundButtonIcon extends StatelessWidget {
  @override
  RoundButtonIcon({this.icon,this.onPress});

  final Widget icon;
  final Function onPress;

  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      child: icon,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: Color(0xC14C4F5E),
      onPressed: onPress,
    );
  }
}