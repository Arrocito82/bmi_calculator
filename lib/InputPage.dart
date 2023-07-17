import 'package:flutter/material.dart';

import 'IconContent.dart';
import 'MyCard.dart';
import 'constants.dart';

enum Gender { female, male, none }

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
                  (_gender == Gender.male) ? kPrimaryLight : kPrimaryDark,
              child: const IconContent(
                icon: Icons.male,
                text: "MALE",
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
                  (_gender == Gender.female) ? kPrimaryLight : kPrimaryDark,
              child: IconContent(
                icon: Icons.female,
                text: "FEMALE",
              ),
            ),
          ),
        ),
      ];
  Expanded getHeigthCard() => Expanded(
        flex: 4,
        child: MyCard(
          primaryColor: kPrimaryLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HEIGHT",
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$_height",
                    style: kNumberTextStyle,
                  ),
                  Text(
                    " cm",
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget getCalculateButton() => Expanded(
        flex: 2,
        child: Container(
          margin: EdgeInsets.all(12.0),
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "CALCULATE",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
  List<Widget> getWeightAgeButtons() => [
        Expanded(
          flex: 3,
          child: MyCard(
            primaryColor: kPrimaryLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WEIGHT",
                  style: kLabelTextStyle,
                ),
                Text(
                  "$_weight",
                  style: kNumberTextStyle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: MyCard(
            primaryColor: kPrimaryLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AGE",
                  style: kLabelTextStyle,
                ),
                Text(
                  "$_age",
                  style: kNumberTextStyle,
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
                  getCalculateButton(),
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
                        getCalculateButton(),
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
