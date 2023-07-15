import 'package:flutter/material.dart';

import 'InputPage.dart';

void main() => runApp(BMICalculator());
const primaryColor = Color.fromRGBO(124, 157, 150, 1.0);
const primaryColorAccent = Color.fromRGBO(210, 215, 209, 1.0);

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
