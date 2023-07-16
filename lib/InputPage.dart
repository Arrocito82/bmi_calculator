import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

import 'IconContent.dart';
import 'MyCard.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _weight = 0;
  int _height = 0;
  int _age = 0;
  int _gender = 0;

  List<Widget> genderButtons = [
    Expanded(
      flex: 3,
      child: MyCard(
        primaryColor: primaryColor,
        child: IconContent(
          icon: Icons.male,
          text: "MALE",
        ),
      ),
    ),
    Expanded(
      flex: 3,
      child: MyCard(
        primaryColor: primaryColor,
        child: IconContent(
          icon: Icons.female,
          text: "FEMALE",
        ),
      ),
    ),
  ];
  Expanded getHeigthCard() => Expanded(
        flex: 4,
        child: MyCard(
          primaryColor: primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HEIGHT"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$_height",
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Text(
                    " cm",
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
                  return Color.fromRGBO(239, 75, 148, 1.0);
                } else {
                  return Color.fromRGBO(255, 156, 186, 1.0);
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
            primaryColor: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("WEIGHT"),
                Text(
                  "$_weight",
                  style: TextStyle(fontSize: 50.0),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: MyCard(
            primaryColor: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("AGE"),
                Text(
                  "$_age",
                  style: TextStyle(fontSize: 50.0),
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
                    children: genderButtons,
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
                            children: genderButtons,
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
