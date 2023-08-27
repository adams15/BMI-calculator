import 'package:flutter/material.dart';

import 'constant.dart';

//how to refactor widget
class BottomBtn extends StatelessWidget {
  BottomBtn({required this.onTap, required this.buttontitle});
  final Function() onTap;
  final String buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttontitle, style: kLargeButtonTextStyle,)),
        padding: EdgeInsets.only(bottom: 20.0),
      
        color:  kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomcontainerHeight,
      ),
    );
  }
}