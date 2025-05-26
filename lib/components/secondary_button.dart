import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;  // Add onTap callback

  const SecondaryButton({
    super.key,
    required this.text,
    this.onTap,  // optional onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,  // handle taps here
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: primaryColor,
        ),
        child: Text(
          text,
          style: secondaryButtonStyle,
        ),
      ),
    );
  }
}
