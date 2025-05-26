import 'package:dsdsoft_project/components/form_field_widget.dart';
import 'package:dsdsoft_project/components/main_button.dart';
import 'package:dsdsoft_project/screens/sales_report/type_dropdown.dart';
import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import '../../components/date_picker_field.dart';

class SalesReportScreen extends StatefulWidget {
  SalesReportScreen({super.key});

  @override
  State<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends State<SalesReportScreen> {
  final _fromDateController = TextEditingController();

  final _toDateController = TextEditingController();

  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: 'Sales Report',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              formFieldWidget('Customer', 'Customer Name'),
              DatePickerField(label: 'From', controller: _fromDateController),
              SizedBox(height: 16),
              DatePickerField(label: 'To', controller: _toDateController),
               SizedBox(height: 16),
              formFieldWidget('DSD ID', ''),

              typeDropdown(
                selectedValue: _selectedType,
                onChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              SizedBox(height: 40),
              MainButton(text: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}


