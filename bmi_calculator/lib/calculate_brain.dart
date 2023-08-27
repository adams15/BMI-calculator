import 'dart:math';
class CalculateBrain {
  
  CalculateBrain({this.height, this.weight, });
  final int? height;
  final int? weight;

    double _bmi = 0.0;

  String calculateBmi(){
     _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return "Overweight";
    }else if(_bmi >18.5){
      return "Normal";
    }else {return"Underweight";}
    
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return "You have a higher body weight, try to exercise regulary";
    }else if(_bmi >18.5){
      return "Normal! you have good BMI";
    }else {return"Underweight! you have abnormal BMI, you have to eat";}
    

  }

}