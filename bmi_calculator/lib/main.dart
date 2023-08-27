import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMI_calculator());
}
class BMI_calculator extends StatelessWidget {
  const BMI_calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0e21),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0a0e21)),
        
      ),
      home: const InputPage(),
      
      
    );
  }
}




