import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  const SecondaryButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: primaryColor,
      ),
      child: Text(
        text,
        style: indexText.copyWith(color: white),
      ),
    );
  }
}
