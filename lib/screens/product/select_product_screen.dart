import 'package:dsdsoft_project/screens/product/product_succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/appbar.dart';
import '../../components/barcode_scanner_screen.dart';
import '../../components/main_button.dart';
import '../../components/search_field.dart';
import '../../components/secondary_button.dart';
import '../../models/product_model.dart';
import '../../providers/product_provider.dart';
import '../../providers/search_provider.dart';
import '../../providers/calculation_provider.dart';
import '../../screens/product/product_form_field.dart';
import '../../screens/product/product_info_widget.dart';
import '../../theme/constants.dart';

class SelectProductScreen extends ConsumerStatefulWidget {
  final Product? initialProduct;
  const SelectProductScreen({super.key, this.initialProduct});

  @override
  ConsumerState<SelectProductScreen> createState() =>
      _SelectProductScreenState();
}

class _SelectProductScreenState extends ConsumerState<SelectProductScreen> {
  late TextEditingController barcodeController;
  late TextEditingController nameController;
  late TextEditingController salesUOMController;
  late TextEditingController priceController;
  late TextEditingController stockController;
  late TextEditingController quantityController;
  late TextEditingController uomController;
  late TextEditingController discountController;

  @override
  void initState() {
    super.initState();
    barcodeController = TextEditingController();
    nameController = TextEditingController();
    salesUOMController = TextEditingController();
    priceController = TextEditingController();
    stockController = TextEditingController();
    quantityController = TextEditingController();
    uomController = TextEditingController();
    discountController = TextEditingController();

    quantityController.addListener(() {
      final qty = double.tryParse(quantityController.text) ?? 0;
      ref.read(quantityProvider.notifier).state = qty;
    });

    discountController.addListener(() {
      final discount = double.tryParse(discountController.text) ?? 0;
      ref.read(discountPercentProvider.notifier).state = discount;
    });

    final product = widget.initialProduct;
    if (product != null) {
      barcodeController.text = product.barcode;
      nameController.text = product.name;
      uomController.text = product.basicUOM;
      salesUOMController.text = product.salesUOM;
      priceController.text = product.salePrice.toString();
    }
  }

  @override
  void dispose() {
    barcodeController.dispose();
    nameController.dispose();
    salesUOMController.dispose();
    priceController.dispose();
    stockController.dispose();
    quantityController.dispose();
    uomController.dispose();
    discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(filteredProductProvider);
    final latestProduct = productList.isNotEmpty ? productList.last : null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (latestProduct != null) {
        if (priceController.text.isEmpty) {
          priceController.text = latestProduct.salePrice.toString();
        }
        if (uomController.text.isEmpty) {
          uomController.text = latestProduct.basicUOM;
        }
        if (salesUOMController.text.isEmpty) {
          salesUOMController.text = latestProduct.salesUOM;
        }
      }
    });

    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(context: context, title: 'Select Product'),
      body: SingleChildScrollView(
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
            const SizedBox(height: 25),
            productFormFieldWidget(
              'Barcode',
              '',
              controller: barcodeController,
              readOnly: true,
            ),
            productFormFieldWidget(
                'Stock', 'Available Stock', controller: stockController),
            productFormFieldWidget(
              'Quantity',
              '',
              keyboardType: TextInputType.number,
              controller: quantityController,
            ),
            productFormFieldWidget('UOM', '', controller: uomController),
            productFormFieldWidget(
              'Price',
              '',
              controller: priceController,
              keyboardType: TextInputType.number,
              readOnly: true,
            ),
            productFormFieldWidget(
              'Discount (%)',
              'Enter Discount',
              keyboardType: TextInputType.number,
              controller: discountController,
            ),
            const SizedBox(height: 10),
            Divider(thickness: 1.5, color: secondaryColor),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTotalInfo(
                      label: 'Untaxed Amount:', provider: subtotalProvider),
                  const SizedBox(height: 15),
                  AnimatedTotalInfo(
                      label: 'VAT (15%):', provider: vatProvider),
                  const SizedBox(height: 15),
                  AnimatedTotalInfo(
                      label: 'Discount:', provider: discountAmountProvider),
                  const SizedBox(height: 15),
                  AnimatedTotalInfo(
                      label: 'Total Amount:', provider: totalProvider),
                ],
              ),
            ),
            const SizedBox(height: 15),
            MainButton(
              text: 'Submit',
              onTap: () async {
                final newProduct = Product(
                  barcode: barcodeController.text.trim(),
                  name: nameController.text.trim(),
                  basicUOM: uomController.text.trim(),
                  salesUOM: salesUOMController.text.trim(),
                  salePrice: double.tryParse(priceController.text) ?? 0,
                );

                ref.read(productProvider.notifier).addProduct(newProduct);

                final productBox = ref.read(productBoxProvider);
                await productBox.add(newProduct);

                barcodeController.clear();
                stockController.clear();
                quantityController.clear();
                uomController.clear();
                salesUOMController.clear();
                priceController.clear();
                discountController.clear();

                if (context.mounted) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProductSuccessScreen(),
                    ),
                  );
                  Navigator.pop(context, true); // Clear form on previous screen
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class AnimatedTotalInfo extends ConsumerWidget {
  final String label;
  final ProviderListenable<double> provider;

  const AnimatedTotalInfo(
      {super.key, required this.label, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(provider);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        '$label ${value.toStringAsFixed(2)}',
        key: ValueKey(value),
        style: formTitleText,
      ),
    );
  }
}
