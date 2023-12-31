import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculate_button.dart';
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
  int _weight = 60;
  int _height = 155;
  int _age = 18;
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
  Widget getCalculateButton() => CalculateButton(
        context: context,
        text: 'CALCULATE',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                title: "normal",
                description:
                    "description description description description description description description description description description description ",
                bmi: 12.5,
              ),
            ),
          );
        },
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
                      onPressed: () {
                        setState(() {
                          _weight--;
                        });
                      },
                      icon: FontAwesomeIcons.minus,
                    ),
                    RoundIconButton(
                      onPressed: () {
                        setState(() {
                          _weight++;
                        });
                      },
                      icon: FontAwesomeIcons.plus,
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
                      onPressed: () {
                        setState(() {
                          _age--;
                        });
                      },
                      icon: FontAwesomeIcons.minus,
                    ),
                    RoundIconButton(
                      onPressed: () {
                        setState(() {
                          _age++;
                        });
                      },
                      icon: FontAwesomeIcons.plus,
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
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: getWeightAgeButtons(),
                          ),
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
