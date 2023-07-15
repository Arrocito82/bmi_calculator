import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());
const primaryColor = Color.fromRGBO(175, 180, 174, 1.0);
const primaryColorAccent = Color.fromRGBO(210, 215, 209, 1.0);

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Text('BODY TEXT'),
      ),
      floatingActionButton: TextButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
