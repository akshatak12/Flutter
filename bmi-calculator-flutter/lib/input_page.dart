import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 50.0;
const bottomContainerColor = Color(0xFFEB1555);
const defaultColor = Color(0xFF111328);
const activeColor = Color(0xFF1D1E33);
const anotherColor = Color(0xFF8D8E98);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  colour: activeColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'MALE',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
              width: 10,
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'FEMALE',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
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
        ],
      )
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.colour,this.cardchild});

  final colour;
  final cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: cardchild,
    );
  }
}
