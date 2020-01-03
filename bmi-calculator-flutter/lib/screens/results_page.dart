import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.resultText,@required this.resultInterpretation,@required this.bmi});

    final String resultText;
    final String resultInterpretation;
    final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text('Your Results',
              style: kLargeTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        resultText,
                        style: kResultTextStyle,
                        textAlign: TextAlign.center,),
                    ),
                  ),
                  Expanded(
                    child: Text (
                      bmi.toStringAsFixed(1),
                      style: kLargeNumberStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      resultInterpretation,
                      style: kInterpretationStyle,
                      textAlign: TextAlign.center,
                ),
                  ),
                ],
              ),
            ),
    ),
          SizedBox(
            height: 15.0,
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
