// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_Btn.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';
import 'result_page.dart';
import 'calculate_brain.dart';
enum Gender{
  male,
  female,
}
int height = 180;
int weight = 60;
int age = 30;


class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender? selectedgender;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: const Center(child: Text("BMI CALCULATOR")),

    ),
    body:   Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //first row
         Expanded(child: Row(
          children: [
             Expanded(child:
              GestureDetector(
                onTap: () {
                  setState(() {
                  selectedgender = Gender.male;
                    
                  });
                },
                child: Reusable_Card( 
                  cardChild: const IconContent(icon: FontAwesomeIcons.mars, label: "MALE",),
                  colour: selectedgender == Gender.male? kActiveCardColor : kInactiveCardColor),
              ),
        ),
              Expanded(child:  GestureDetector(
                onTap: () {
                  setState(() {
                    selectedgender= Gender.female;
                  });
                },
                child: Reusable_Card(
                  cardChild: const IconContent(icon: FontAwesomeIcons.venus, label: "FEMALE",), 
                  
                  colour:  selectedgender == Gender.female? kActiveCardColor : kInactiveCardColor),
              )
        ),
        ],
        )),
        //second row
          Expanded(child: Reusable_Card(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           const Text("HEIGHT",style: kLabelTextStyle,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(height.toString(), style:kNumberStyle),
              const Text("cm", style: kLabelTextStyle,)

            ],
           ),
           // our complete slider code
           SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: const Color(0xffeb1555),
              overlayColor: const Color(0x29eb1555),
              activeTrackColor: Colors.white,
              thumbShape:
            const RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),

              
            ),
             child: Slider(value: height.toDouble(),
             min: 120.0,
             max: 220.0,
            // activeColor: Colors.red,
             inactiveColor: const Color(0xff8d8e98),
              onChanged: (double newValue){
                setState(() {
                  height=newValue.round();
                });
           
              }),
           )

          ],),
           colour:  kActiveCardColor),),
         //third row
           Expanded(child: Row(
            children: [
               Expanded(child:  Reusable_Card( 
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: kLabelTextStyle,),
                    Text(weight.toString(),
                    style: kNumberStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                     setState(() {
                        weight++;
                     });}),
                    SizedBox(width: 10.0,),
                    RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                      setState(() {
                        weight--;
                      });})
                      ],
                    )

                  ],
                ),
                ),
        ),
                Expanded(child:  Reusable_Card( colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: kLabelTextStyle,),
                    Text(age.toString(),
                    style: kNumberStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                     setState(() {
                        age++;
                     });}),
                    SizedBox(width: 10.0,),
                    RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                      setState(() {
                        age--;
                      });})
                      ],
                    )

                  ],
                ),),
        ),
            ],
          ),
          ),
          // how to use refactor widget here
      BottomBtn(buttontitle: "CALCULATE", onTap: (){
        // the functionality here
        CalculateBrain calc = CalculateBrain(height: height, weight: weight);

        Navigator.push(context, MaterialPageRoute(builder: ((context) => ResultPage(
          bmiResult: calc.calculateBmi(),
          resultText: calc.getResult(),
          interpretation: calc.getInterpretation(),
        ))));
      },)  
            ],
    ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,

      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}

