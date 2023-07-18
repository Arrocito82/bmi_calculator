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
    Expanded yourResult = Expanded(
        child: Center(
      child: Text(
        "Your Result",
        style: kNumberTextStyle,
      ),
    ));
    Expanded titleWidget = Expanded(
        child: Center(
      child: Text(
        "$title",
        style: kTitleTextStyle,
      ),
    ));
    Expanded bmiWidget = Expanded(
        child: Center(
      child: Text(
        "$bmi",
        style: kNumberTextStyle,
      ),
    ));
    Expanded descriptionWidget = Expanded(
        child: Center(
      child: Text(
        "$description",
        style: kLabelTextStyle,
        textAlign: TextAlign.center,
      ),
    ));
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
              yourResult,
              titleWidget,
              bmiWidget,
              descriptionWidget,
              calculateButton,
            ],
          );
        } else {
          return Column(
            children: [
              yourResult,
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          titleWidget,
                          bmiWidget,
                        ],
                      ),
                    ),
                    descriptionWidget,
                  ],
                ),
              ),
              calculateButton
            ],
          );
        }
      }),
    );
  }
}
