import 'package:flutter/material.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'my_card.dart';

enum Gender { female, male, none }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
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
              child: const IconContent(
                icon: Icons.female,
                text: "FEMALE",
              ),
            ),
          ),
        ),
      ];
  Expanded getHeightCard() => Expanded(
        flex: 4,
        child: MyCard(
          primaryColor: kPrimaryLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "HEIGHT",
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$_height",
                    style: kNumberTextStyle,
                  ),
                  const Text(
                    " cm",
                    style: kLabelTextStyle,
                  ),
                ],
              ),
              Slider(
                value: _height.toDouble(),
                max: 100,
                divisions: 100,
                label: null,
                onChanged: (double value) {
                  setState(() {
                    _height = value.round();
                  });
                },
              )
            ],
          ),
        ),
      );
  Widget getCalculateButton() => Expanded(
        flex: 2,
        child: Container(
          margin: const EdgeInsets.all(12.0),
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: const Text(
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
                const Text(
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
                const Text(
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
        title: const Text('BMI CALCULATOR'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              children: [
                Row(
                  children: getGenderButtons(),
                ),
                getHeightCard(),
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
                      getHeightCard(),
                      getCalculateButton(),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
