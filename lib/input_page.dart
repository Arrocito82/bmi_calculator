import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  int _height = 155;
  int _age = 0;
  Gender _gender = Gender.none;

  List<Widget> getGenderButtons() => [
        Expanded(
          flex: 2,
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
                icon: FontAwesomeIcons.mars,
                text: "MALE",
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
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
                icon: FontAwesomeIcons.venus,
                text: "FEMALE",
              ),
            ),
          ),
        ),
      ];
  Expanded getHeightCard({int flex = 2}) => Expanded(
        flex: flex,
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
              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                      pressedElevation: 25.0,
                      elevation: 10.0,
                    ),
                  ),
                  child: Slider(
                    value: _height.toDouble(),
                    max: kMaxHeight.toDouble(),
                    min: kMinHeight.toDouble(),
                    divisions: 100,
                    label: null,
                    activeColor: kPrimaryActive,
                    thumbColor: kPrimaryDark,
                    inactiveColor: kPrimaryInactive,
                    onChanged: (double value) {
                      setState(() {
                        _height = value.round();
                      });
                    },
                  ))
            ],
          ),
        ),
      );
  Widget getCalculateButton() => Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.all(7.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIconButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.plus,
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.minus,
                    ),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIconButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.plus,
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: FontAwesomeIcons.minus,
                    ),
                  ],
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: OrientationBuilder(
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
                        getHeightCard(flex: 3),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: getGenderButtons(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: getWeightAgeButtons(),
                        ),
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
