import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'InputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kDefaultFontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryDark,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: kDefaultFontFamily,
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
                return kSecondaryDark;
              } else {
                return kSecondaryLight;
              }
            }),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontFamily: kDefaultFontFamily,
                letterSpacing: 2.5,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        scaffoldBackgroundColor: kBackground,
      ),
    );
  }
}
