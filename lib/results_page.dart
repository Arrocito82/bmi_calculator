import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'calculate_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.title,
      required this.description,
      required this.bmi});
  final String title;
  final String description;
  final double bmi;

  @override
  Widget build(BuildContext context) {
    Text yourResult = Text(
      "Your Result",
      style: kNumberTextStyle,
    );
    Text titleWidget = Text(
      "$title",
      style: kTitleTextStyle,
    );
    Text bmiWidget = Text(
      "$bmi",
      style: kResultNumberTextStyle,
    );
    Text descriptionWidget = Text(
      "$description",
      style: kLabelTextStyle,
      textAlign: TextAlign.center,
    );
    CalculateButton calculateButton = CalculateButton(
      context: context,
      text: "RE-CALCULATE",
      onPressed: () {
        Navigator.pop(context);
      },
    );
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: yourResult,
                    ),
                    titleWidget,
                    bmiWidget,
                    descriptionWidget,
                  ],
                ),
              ),
              calculateButton,
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: yourResult,
                    ),
                    titleWidget,
                    bmiWidget,
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(child: descriptionWidget),
                    ),
                    calculateButton,
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
