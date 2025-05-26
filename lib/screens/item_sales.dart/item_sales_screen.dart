import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import '../../components/date_picker_field.dart';
import '../../components/form_field_widget.dart';
import '../../components/main_button.dart';
import '../../theme/constants.dart';

class ItemSalesScreen extends StatefulWidget {
  ItemSalesScreen({super.key});

  @override
  State<ItemSalesScreen> createState() => _ItemSalesScreenState();
}

class _ItemSalesScreenState extends State<ItemSalesScreen> {
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();

  String _selectedType = 'Summary'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: 'Item Sales',
      ),
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            
            children: [
              formFieldWidget('Customer', 'Customer Name'),
              formFieldWidget('Item', 'Item Name'),
              DatePickerField(label: 'From', controller: _fromDateController),
              SizedBox(height: 16),
              DatePickerField(label: 'To', controller: _toDateController),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Type:', style: formTitleText),
                  SizedBox(width: 12),
                  Radio<String>(
                    value: 'Summary',
                    groupValue: _selectedType,
                    activeColor: Colors.grey[700],
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                  Text('Summary',
                      style: formTitleText.copyWith(color: Colors.grey[700])),
                ],
              ),
              SizedBox(height: 30),
              MainButton(text: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
