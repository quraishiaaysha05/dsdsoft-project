import 'package:flutter/material.dart';

import '../theme/constants.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  const SearchField({super.key, required this.hintText });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: black,
      
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, size: 24, color: primaryColor),
        hintText: 'Search $hintText',
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
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
      onChanged: (value) {},
    );
  }
}
