import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/main_button.dart';
import '../../components/form_field_widget.dart';
import '../../models/customer_model.dart';
import '../../providers/customer_provider.dart';
import '../../theme/constants.dart';

class AddCustomerScreen extends ConsumerStatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  ConsumerState<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends ConsumerState<AddCustomerScreen> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final vatController = TextEditingController();
  final modeController = TextEditingController();
  final creditLimitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.arrow_back, color: primaryColor),
                ),
              ),
              Text('Add Customer', style: mainTitleText),
              SizedBox(width: 40),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            formFieldWidget('Name', 'Customer Name',
                controller: nameController),
            formFieldWidget('Address', 'Customer Address',
                controller: addressController),
            formFieldWidget('Contact', 'XXXXX XXXXX',
                keyboardType: TextInputType.phone,
                prefixText: '+91 ',
                controller: phoneController),
            formFieldWidget('VAT No', 'Not Available',
                controller: vatController),
            Row(
              children: [
                Expanded(
                    child: formFieldWidget('Mode', 'Cash',
                        controller: modeController)),
                SizedBox(width: 7),
                Expanded(
                  child: formFieldWidget('Credit Limit', 'XXXX',
                      controller: creditLimitController),
                ),
              ],
            ),
            const SizedBox(height: 10),
            MainButton(
              text: 'Submit',
              onTap: () {
                if (nameController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please fill all required fields."),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }

                ref.read(customerProvider.notifier).addCustomer(Customer(
                      name: nameController.text,
                      location: addressController.text,
                      phone: phoneController.text,
                    ));

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
