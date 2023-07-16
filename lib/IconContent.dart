import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent(
      {super.key,
      required this.icon,
      required this.text,
      required this.textStyle});

  final IconData icon;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 50.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(text, style: textStyle),
        ),
      ],
    );
  }
}
