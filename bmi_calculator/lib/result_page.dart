import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottom_Btn.dart';
class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiResult, required this.interpretation, required this.resultText});
 final String bmiResult;
 final String resultText;
 final String interpretation;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR",),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            child: Center(child: const Text("Your Result", style: kTitleTextStyle,)),
          )
          ),
          Expanded(
            flex: 5,
            child: Reusable_Card(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle,),
                  Text(bmiResult, style: kBmiTextStyle),
                  Text(interpretation,
                   textAlign: TextAlign.center,)
                  
                ],
              ),

          ),),
          BottomBtn(onTap: (){
            Navigator.pop(context);
          }, buttontitle: "RE_CALCULATE")
        ],
      ),
    );
  }
}