import 'package:bmi_calculator/MyColorPalette.dart';
import 'package:flutter/material.dart';

import 'InputPage.dart';

void main() => runApp(BMICalculator());

const String defaultFontFamily = "Tektur";

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: defaultFontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryDark,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 30.0,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              if (states.any((element) => element == MaterialState.pressed)) {
                return secondaryDark;
              } else {
                return secondaryLight;
              }
            }),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontFamily: defaultFontFamily,
                letterSpacing: 2.5,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        scaffoldBackgroundColor: background,
      ),
    );
  }
}
