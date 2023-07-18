import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton(
      {super.key,
      required this.context,
      required this.onPressed,
      required this.text});

  final BuildContext context;
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(7.0),
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
