import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String _textToBeChanged;

  TextOutput(this._textToBeChanged);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(_textToBeChanged);
  }
}