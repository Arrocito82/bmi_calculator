import 'package:flutter/material.dart';

import 'IconContent.dart';
import 'MyCard.dart';
import 'MyColorPalette.dart';

enum Gender { female, male, none }

TextStyle numberTextStyle = TextStyle(fontSize: 50.0);
TextStyle labelTextStyle = TextStyle(
  fontWeight: FontWeight.w800,
  letterSpacing: 2.5,
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _weight = 0;
  int _height = 0;
  int _age = 0;
  Gender _gender = Gender.none;

  List<Widget> getGenderButtons() => [
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _gender = (_gender == Gender.male) ? Gender.none : Gender.male;
              });
            },
            child: MyCard(
              primaryColor:
                  (_gender == Gender.male) ? primaryLight : primaryDark,
              child: IconContent(
                icon: Icons.male,
                text: "MALE",
                textStyle: labelTextStyle,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _gender =
                    (_gender == Gender.female) ? Gender.none : Gender.female;
              });
            },
            child: MyCard(
              primaryColor:
                  (_gender == Gender.female) ? primaryLight : primaryDark,
              child: IconContent(
                icon: Icons.female,
                text: "FEMALE",
                textStyle: labelTextStyle,
              ),
            ),
          ),
        ),
      ];
  Expanded getHeigthCard() => Expanded(
        flex: 4,
        child: MyCard(
          primaryColor: primaryLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HEIGHT",
                style: labelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$_height",
                    style: numberTextStyle,
                  ),
                  Text(
                    " cm",
                    style: labelTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget getCalculateButton1() => Expanded(
        flex: 2,
        child: Container(
          margin: EdgeInsets.all(12.0),
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
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
            ),
            child: Text(
              "CALCULATE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      );
  List<Widget> getWeightAgeButtons() => [
        Expanded(
          flex: 3,
          child: MyCard(
            primaryColor: primaryLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WEIGHT",
                  style: labelTextStyle,
                ),
                Text(
                  "$_weight",
                  style: numberTextStyle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: MyCard(
            primaryColor: primaryLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AGE",
                  style: labelTextStyle,
                ),
                Text(
                  "$_age",
                  style: numberTextStyle,
                ),
              ],
            ),
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Column(
                children: [
                  Row(
                    children: getGenderButtons(),
                  ),
                  getHeigthCard(),
                  Row(
                    children: getWeightAgeButtons(),
                  ),
                  getCalculateButton1(),
                ],
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: getGenderButtons(),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: getWeightAgeButtons(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        getHeigthCard(),
                        getCalculateButton1(),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
