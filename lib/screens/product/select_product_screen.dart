import 'package:dsdsoft_project/components/main_button.dart';
import 'package:dsdsoft_project/components/search_field.dart';
import 'package:dsdsoft_project/screens/product/product_form_field.dart';
import 'package:dsdsoft_project/screens/product/product_info_widget.dart';
import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import '../../components/secondary_button.dart';

class SelectProductScreen extends StatelessWidget {
  const SelectProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: 'Select Product',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 15),
              SearchField(hintText: 'Product'),
              SizedBox(height: 20),
              SecondaryButton(text: 'Scan A Barcode'),
              SizedBox(height: 25),
              productFormFieldWidget('Stock', 'Available Stock'),
              productFormFieldWidget(
                'Quantity',
                '',
                keyboardType: TextInputType.number
              ),
              productFormFieldWidget(
                'UOM',
                'Unit',
                keyboardType: TextInputType.number
              ),
              productInfoWidget('Price', 'Unit Price'),
              productInfoWidget('Discount', 'Total Discount'),
              SizedBox(height: 10),
              Divider(
                thickness: 1.5,
                color: secondaryColor,
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Untaxed Amount: ', style: formTitleText),
                    SizedBox(height: 15),
                    Text('VAT: ', style: formTitleText),
                    SizedBox(height: 15),
                    Text('Discount: ', style: formTitleText),
                    SizedBox(height: 15),
                    Text('Total Amount: ', style: formTitleText),
                  ],
                ),
              ),
              SizedBox(height: 15),
              MainButton(text: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
