import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/constants.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final void Function(DateTime)? onDatePicked;

  const DatePickerField({
    required this.label,
    required this.controller,
    this.onDatePicked,
    super.key,
  });

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
      if (onDatePicked != null) onDatePicked!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: formTitleText),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: () => _pickDate(context),
          decoration: InputDecoration(
            hintText: 'DD-MM-YYYY',
            hintStyle: formTitleText.copyWith(color: Colors.grey[300]),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _pickDate(context),
            ),
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
          validator: (value) =>
              value == null || value.isEmpty ? 'Please select a date' : null,
        ),
      ],
    );
  }
}
