import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 70.0;
const bottomContainerColor = Color(0xFFEB1555);
const inactiveColor = Color(0xFF111328);
const activeColor = Color(0xFF1D1E33);
const anotherColor = Color(0xFF8D8E98);
const defaultColor = Color(0xFF0E0C20);




class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female
}

class _InputPageState extends State<InputPage> {

  var selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: defaultColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.male ? activeColor : inactiveColor,
                  cardchild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });

                  },
                ),
              ),
              SizedBox(
              width: 10,
              ),
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.female ? activeColor : inactiveColor,
                  cardchild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                )
              ),
            ],

          )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ReusableCard(
                colour: activeColor,
              )
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeColor,
                )
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:ReusableCard(
                  colour: activeColor,
                )
              ),
            ],
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
          ),
        ],
      )
    );
  }
}



