import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_button_icon.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/bmi-calculator-brain.dart';

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
  int height = 150;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultColor,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: kDefaultColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.male ? kActiveColor : kInactiveColor,
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
                  colour: selectedGender == Gender.female ? kActiveColor : kInactiveColor,
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
                colour: kActiveColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',
                      style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor:  Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 34)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 280,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                      style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundButtonIcon(
                          icon: Icon(FontAwesomeIcons.minus),
                          onPress: () {
                            setState(() {
                              weight = weight - 1;
                            });
                          },
                        ),
                        SizedBox(
                        width: 20,
                        ),
                        RoundButtonIcon(
                          icon: Icon(FontAwesomeIcons.plus),
                          onPress: () {
                            setState(() {
                              weight = weight + 1;
                            });
                          },
                        ),
                      ],
                      )



                    ],
                  ),

                )
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:ReusableCard(
                  colour: kActiveColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButtonIcon(
                            icon: Icon(FontAwesomeIcons.minus),
                            onPress: () {
                              setState(() {
                                age = age - 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RoundButtonIcon(
                            icon: Icon(FontAwesomeIcons.plus),
                            onPress: () {
                              setState(() {
                                age = age + 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ),
            ],
          )),
          SizedBox(
            height: 10,
          ),
          BottomButton(
            title: 'CALCULATE BMI',
            onTap: (){
              BMICalculator bmiCalc = BMICalculator(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmi: bmiCalc.getBMI(),
                resultText: bmiCalc.getResult(),
                resultInterpretation: bmiCalc.getInterpretation(),
              )));
            },
          ),
        ],
      )
    );
  }
}




