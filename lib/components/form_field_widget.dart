import 'package:flutter/material.dart';

import '../theme/constants.dart';

import 'package:flutter/material.dart';

import '../theme/constants.dart';

Widget formFieldWidget(
  String fieldName,
  String hintText, {
  TextInputType keyboardType = TextInputType.text,
  String? prefixText,
  bool includeBottomSpacing = true,
  TextEditingController? controller,
}) {
  final showPrefix = prefixText != null;

  final field = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(fieldName, style: formTitleText),
      const SizedBox(height: 5),
      TextField(
        controller: controller,
        cursorColor: black,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixText: showPrefix ? prefixText : null,
          hintText: hintText,
          hintStyle: formTitleText.copyWith(color: Colors.grey[300]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.7,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: black,
              width: 1.2,
            ),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    ],
  );

  return includeBottomSpacing
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            field,
            const SizedBox(height: 25),
          ],
        )
      : field;
}
