import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/appbar.dart';
import '../../components/date_picker_field.dart';
import '../../components/form_field_widget.dart';
import '../../components/main_button.dart';
import '../../models/sales_report_model.dart';
import '../../theme/constants.dart';
import '../../providers/sales_report_provider.dart';
import 'type_dropdown.dart';

class SalesReportScreen extends ConsumerStatefulWidget {
  final SalesReportModel? existingReport;
  final int? index; // index in Hive box, required for updating

  const SalesReportScreen({super.key, this.existingReport, this.index});

  @override
  ConsumerState<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends ConsumerState<SalesReportScreen> {
  final _customerController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _dsdIdController = TextEditingController();

  String? _selectedType;

  @override
  void initState() {
    super.initState();

    // If editing an existing report, fill the form
    final existing = widget.existingReport;
    if (existing != null) {
      _customerController.text = existing.customer;
      _fromDateController.text = existing.fromDate.toIso8601String().split('T').first;
      _toDateController.text = existing.toDate.toIso8601String().split('T').first;
      _dsdIdController.text = existing.dsdId;
      _selectedType = existing.type;
    }
  }

  @override
  void dispose() {
    _customerController.dispose();
    _fromDateController.dispose();
    _toDateController.dispose();
    _dsdIdController.dispose();
    super.dispose();
  }

  void _submit() {
    final customer = _customerController.text.trim();
    final dsdId = _dsdIdController.text.trim();
    final fromDate = DateTime.tryParse(_fromDateController.text.trim());
    final toDate = DateTime.tryParse(_toDateController.text.trim());
    final type = _selectedType;

    if (customer.isEmpty || dsdId.isEmpty || fromDate == null || toDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')),
      );
      return;
    }

    final report = SalesReportModel(
      customer: customer,
      fromDate: fromDate,
      toDate: toDate,
      dsdId: dsdId,
      type: type,
    );

    final notifier = ref.read(salesReportProvider.notifier);

    if (widget.index != null) {
      notifier.updateReport(widget.index!, report);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sales report updated')),
      );
    } else {
      notifier.addReport(report);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sales report saved')),
      );
    }

    Navigator.pop(context); // Close the form
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: widget.index != null ? 'Edit Sales Report' : 'New Sales Report',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              formFieldWidget('Customer', 'Customer Name', controller: _customerController),
              DatePickerField(label: 'From', controller: _fromDateController),
              const SizedBox(height: 16),
              DatePickerField(label: 'To', controller: _toDateController),
              const SizedBox(height: 16),
              formFieldWidget('DSD ID', '', controller: _dsdIdController),
              typeDropdown(
                selectedValue: _selectedType,
                onChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              const SizedBox(height: 40),
              MainButton(
                text: widget.index != null ? 'Update' : 'Save',
                onTap: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
