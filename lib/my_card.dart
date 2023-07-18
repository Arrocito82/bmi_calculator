import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final primaryColor;
  final Widget child;
  MyCard({super.key, required this.child, this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 7),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
