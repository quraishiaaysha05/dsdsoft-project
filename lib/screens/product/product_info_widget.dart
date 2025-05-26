import 'package:flutter/material.dart';

import '../../theme/constants.dart';

Widget productInfoWidget(String fieldName, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          flex: 2, // Match with label flex in form field
          child: Text(
            fieldName,
            style: formTitleText,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3, // Match with input field flex in form field
          child: Text(
            value,
            style: formTitleText.copyWith(color: Colors.grey[400]),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}
