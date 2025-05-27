import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/appbar.dart';
import '../../components/date_picker_field.dart';
import '../../components/form_field_widget.dart';
import '../../components/main_button.dart';
import '../../theme/constants.dart';
import '../../models/item_sales_model.dart';
import '../../providers/item_sales_provider.dart';

class ItemSalesScreen extends ConsumerStatefulWidget {
  const ItemSalesScreen({super.key});

  @override
  ConsumerState<ItemSalesScreen> createState() => _ItemSalesScreenState();
}

class _ItemSalesScreenState extends ConsumerState<ItemSalesScreen> {
  final _customerController = TextEditingController();
  final _itemController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();

  String _selectedType = 'Summary'; // Default selected value

  void _submit() {
    final customer = _customerController.text.trim();
    final item = _itemController.text.trim();
    final fromDate = DateTime.tryParse(_fromDateController.text.trim());
    final toDate = DateTime.tryParse(_toDateController.text.trim());

    if (customer.isEmpty || item.isEmpty || fromDate == null || toDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final newSale = ItemSalesModel(
      customer: customer,
      item: item,
      fromDate: fromDate,
      toDate: toDate,
      type: _selectedType,
    );

    ref.read(itemSalesProvider.notifier).addItemSale(newSale);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item sale saved successfully')),
    );

    // Clear form fields
    _customerController.clear();
    _itemController.clear();
    _fromDateController.clear();
    _toDateController.clear();
    setState(() {
      _selectedType = 'Summary';
    });
  }

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
              formFieldWidget('Customer', 'Customer Name', controller: _customerController),
              formFieldWidget('Item', 'Item Name', controller: _itemController),
              DatePickerField(label: 'From', controller: _fromDateController),
              const SizedBox(height: 16),
              DatePickerField(label: 'To', controller: _toDateController),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('Type:', style: formTitleText),
                  const SizedBox(width: 12),
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
                  Text('Summary', style: formTitleText.copyWith(color: Colors.grey[700])),
                ],
              ),
              const SizedBox(height: 30),
              MainButton(
                text: 'Submit',
                onTap: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
