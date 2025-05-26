import 'package:flutter/material.dart';
import '../../theme/constants.dart';

Widget productFormFieldWidget(
  String fieldName,
  String hintText, {
  TextInputType keyboardType = TextInputType.text,
  TextEditingController? controller,
  bool readOnly = false, // <-- Add this line,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            fieldName,
            style: formTitleText,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: controller,
            cursorColor: black,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: formTitleText.copyWith(color: Colors.grey[300]),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey, width: 0.7),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: black, width: 1.2),
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
        ),
      ],
    ),
  );
}
