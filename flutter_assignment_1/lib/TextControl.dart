import 'package:flutter/material.dart';

import './TextOutput.dart';

class TextControl extends StatefulWidget {
  final String textToBeChanged;

  TextControl(this.textToBeChanged);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextControlState();
  }
}


class TextControlState extends State<TextControl> {
   String _textToBeChanged;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textToBeChanged = widget.textToBeChanged;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _textToBeChanged = "You clicked the button!!!";
              });
            },
            child: Text('Change Text'),
          ),
        ),

        TextOutput(_textToBeChanged),
      ],
    );
  }
}