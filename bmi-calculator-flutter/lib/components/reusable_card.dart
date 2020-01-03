import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  const ReusableCard({this.colour,this.cardchild,this.onPress});

  final colour;
  final cardchild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: cardchild,
      ),
    );
  }
}