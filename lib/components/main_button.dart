import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  const MainButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          text,
          style: subtitleText.copyWith(
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
