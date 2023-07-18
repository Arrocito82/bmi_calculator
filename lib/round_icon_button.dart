import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {required this.onPressed,
      super.key,
      required this.icon,
      this.fillColor = kPrimaryActive,
      this.highlightColor = kPrimaryDark,
      this.size = 45,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0)});

  final VoidCallback onPressed;
  final IconData icon;
  final Color fillColor;
  final Color highlightColor;
  final double size;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          height: size,
          width: size,
        ),
        shape: CircleBorder(),
        fillColor: fillColor,
        highlightColor: highlightColor,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
