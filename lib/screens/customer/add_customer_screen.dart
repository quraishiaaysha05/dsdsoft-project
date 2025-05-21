import 'package:dsdsoft_project/components/main_button.dart';
import 'package:dsdsoft_project/screens/customer/form_field_widget.dart';
import 'package:dsdsoft_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomeScreen())),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.home,
                    color: primaryColor,
                  ),
                ),
              ),
              Text(
                'Add Customer',
                style: titleText,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context); // Go back when tapped
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 20,
                  child: Icon(
                    Icons.arrow_back,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                FormFieldWidget('Name', 'Customer Name'),
                FormFieldWidget('Address', 'Customer Address'),
                FormFieldWidget(
                  'Contact',
                  'XXXXX XXXXX',
                  keyboardType: TextInputType.phone,
                  prefixText: '+91 ',
                ),
                FormFieldWidget('VAT No', 'Not Available'),
                Row(
                  children: [
                    Expanded(child: FormFieldWidget('Mode', 'Cash')),
                    SizedBox(width: 7),
                    Expanded(child: FormFieldWidget('Credit Limit', 'XXXX')),
                  ],
                ),
                SizedBox(height: 10),
                MainButton(text: 'Submit'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
