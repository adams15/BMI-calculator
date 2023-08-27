import 'package:flutter/material.dart';
class Reusable_Card extends StatelessWidget {
 const Reusable_Card({  this.colour,   this.cardChild});
 final Color? colour;
 final Widget?  cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
     margin: const EdgeInsets.all(15.0),
     decoration: BoxDecoration(
       color: colour,
       borderRadius: BorderRadius.circular(10.0),
     ),
        
        );
  }
}
