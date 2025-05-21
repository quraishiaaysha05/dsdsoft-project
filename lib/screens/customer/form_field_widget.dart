import 'package:flutter/material.dart';

import '../../theme/constants.dart';

Widget FormFieldWidget(
  String fieldName,
  String hintText, {
  TextInputType keyboardType = TextInputType.text,
  String? prefixText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(fieldName, style: formTitleText),
      SizedBox(height: 5),
      TextField(
        cursorColor: black,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: formTitleText.copyWith(color: Colors.grey[300]),
          prefix: prefixText != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    prefixText,
                    style: formTitleText.copyWith(color: black),
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
        ),
      ),
      SizedBox(height: 25),
    ],
  );
}
