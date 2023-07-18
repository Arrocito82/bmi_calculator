import 'package:flutter/material.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 50.0,
        ),
        Text(text, style: kLabelTextStyle),
      ],
    );
  }
}
