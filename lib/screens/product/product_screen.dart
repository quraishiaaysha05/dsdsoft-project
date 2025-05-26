import 'package:dsdsoft_project/components/main_button.dart';
import 'package:dsdsoft_project/components/search_field.dart';
import 'package:dsdsoft_project/components/secondary_button.dart';
import 'package:dsdsoft_project/components/form_field_widget.dart';
import 'package:dsdsoft_project/screens/product/select_product_screen.dart';
import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../components/appbar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: 'Product',
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
              SizedBox(height: 20),
              formFieldWidget('Barcode', 'Barcode Number'),
              formFieldWidget('Name', 'Product Name'),
              formFieldWidget('Basic UOM', 'UOM Number'),
              formFieldWidget('Sales UOM', 'Sales UOM Number'),
              formFieldWidget('Sale Price', 'Enter Sales Price'),
              SizedBox(height: 18),
              Row(
                children: [
                  SecondaryButton(text: 'Active/Inactive'),
                  SizedBox(width: 7),
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectProductScreen())),
                      child: SecondaryButton(text: 'Continue')),
                ],
              ),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
