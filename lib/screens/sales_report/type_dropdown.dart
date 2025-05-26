import 'package:flutter/material.dart';

import '../../theme/constants.dart';

Widget typeDropdown({
  required String? selectedValue,
  required void Function(String?) onChanged,
}) {
  final List<String> options = ['both']; // Add more later if needed

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Type', style: formTitleText),
        SizedBox(height: 5),
      DropdownButtonFormField<String>(
        value: selectedValue,
        items: options
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Type',
          hintStyle: formTitleText.copyWith(color: Colors.grey[300]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
    ],
  );
}
