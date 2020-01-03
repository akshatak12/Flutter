import 'dart:math';
class BMICalculator {

  BMICalculator({this.height,this.weight});

  int height;
  int weight;

  double _bmi;

  double getBMI() {
    _bmi = weight/pow(height/100, 2);
    return _bmi;
  }

  String getResult(){
    if (_bmi >= 25.5){
      return 'Overweight';
    }else if (_bmi >= 18.5) {
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.5){
      return 'You are overweight.You need to exercise more!!.';
    }else if (_bmi >= 18.5) {
      return 'You are normal.Good job.';
    }else {
      return 'You are Underweight.You need to eat more!!!';
    }
  }

}