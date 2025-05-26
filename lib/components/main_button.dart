import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap; // ✅ Add this

  const MainButton({
    super.key,
    required this.text,
    this.onTap, // ✅ Add this
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // ✅ Wrap with tap detection
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: mainButtonStyle,
          ),
        ),
      ),
    );
  }
}
