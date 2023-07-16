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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
            children: [
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MyCard(
                          primaryColor: primaryColor,
                          child: IconContent(
                            icon: Icons.male,
                            text: "MALE",
                          ),
                        ),
                      ),
                      Expanded(
                        child: MyCard(
                          primaryColor: primaryColor,
                          child: IconContent(
                            icon: Icons.female,
                            text: "FEMALE",
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyCard(
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
                ],
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
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
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => (states == MaterialState.pressed ||
                                  states == MaterialState.focused ||
                                  states == MaterialState.selected)
                              ? Color.fromRGBO(255, 139, 68, 1.0)
                              : Color.fromRGBO(233, 179, 132, 1)),
                      shape: MaterialStateProperty.all(
                        ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          // side: BorderSide(width: double.infinity)
                        ),
                      ),
                      // minimumSize: MaterialStateProperty.resolveWith(
                      //   (states) => Size(
                      //     double.infinity,
                      //     50.0,
                      //   ),
                      // ),
                    ),
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
