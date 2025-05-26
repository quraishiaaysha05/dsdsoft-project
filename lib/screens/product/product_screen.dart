import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/appbar.dart';
import '../../components/barcode_scanner_screen.dart';
import '../../components/form_field_widget.dart';
import '../../components/search_field.dart';
import '../../components/secondary_button.dart';
import '../../models/product_model.dart';
import '../../providers/product_provider.dart';
import '../../providers/search_provider.dart';
import '../../screens/product/select_product_screen.dart';
import '../../theme/constants.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  final barcodeController = TextEditingController();
  final nameController = TextEditingController();
  final basicUOMController = TextEditingController();
  final salesUOMController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(context: context, title: 'Product'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 15),
              SearchField(
                hintText: 'Product',
                onChanged: (value) =>
                    ref.read(searchTermProvider.notifier).state = value,
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                text: 'Scan A Barcode',
                onTap: () async {
                  final scannedBarcode = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const BarcodeScannerScreen()),
                  );

                  if (scannedBarcode != null) {
                    barcodeController.text = scannedBarcode;
                  }
                },
              ),
              const SizedBox(height: 20),
              formFieldWidget('Barcode', 'Barcode Number',
                  controller: barcodeController),
              formFieldWidget('Name', 'Product Name',
                  controller: nameController),
              formFieldWidget('Basic UOM', 'UOM Number',
                  controller: basicUOMController),
              formFieldWidget('Sales UOM', 'Sales UOM Number',
                  controller: salesUOMController),
              formFieldWidget('Sale Price', 'Enter Sales Price',
                  controller: priceController),
              const SizedBox(height: 18),
              Row(
                children: [
                  const SecondaryButton(text: 'Active/Inactive'),
                  const SizedBox(width: 7),
                  GestureDetector(
                    onTap: () async {
                      ref.read(productProvider.notifier).addProduct(
                            Product(
                              barcode: barcodeController.text,
                              name: nameController.text,
                              basicUOM: basicUOMController.text,
                              salesUOM: salesUOMController.text,
                              salePrice:
                                  double.tryParse(priceController.text) ?? 0,
                            ),
                          );

                      final shouldClear = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SelectProductScreen(
                            initialProduct: Product(
                              barcode: barcodeController.text,
                              name: nameController.text,
                              basicUOM: basicUOMController.text,
                              salesUOM: salesUOMController.text,
                              salePrice:
                                  double.tryParse(priceController.text) ?? 0,
                            ),
                          ),
                        ),
                      );

                      if (shouldClear == true) {
                        barcodeController.clear();
                        nameController.clear();
                        basicUOMController.clear();
                        salesUOMController.clear();
                        priceController.clear();
                      }
                    },
                    child: const SecondaryButton(text: 'Continue'),
                  ),
                ],
              ),
              const SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
