import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/customer_model.dart';
import 'models/item_sales_model.dart';
import 'models/sales_report_model.dart';
import 'providers/customer_provider.dart';
import 'providers/product_provider.dart';
import 'providers/sales_report_provider.dart';
import 'providers/item_sales_provider.dart';
import 'screens/home/home_screen.dart';

import 'models/product_model.dart';  // import your product model and adapter

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ItemSalesModelAdapter());
  Hive.registerAdapter(SalesReportModelAdapter());
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(ProductAdapter());  // Register your Product adapter

  final salesReportBox = await Hive.openBox<SalesReportModel>('sales_reports');
  final itemSalesBox = await Hive.openBox<ItemSalesModel>('item_sales');
  final customerBox = await Hive.openBox<Customer>('customers');
  final productBox = await Hive.openBox<Product>('products');  // Open product box

  runApp(
    ProviderScope(
      overrides: [
        salesReportBoxProvider.overrideWithValue(salesReportBox),
        itemSalesBoxProvider.overrideWithValue(itemSalesBox),
        customerBoxProvider.overrideWithValue(customerBox),
        productBoxProvider.overrideWithValue(productBox),  // Override product box provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSD Soft',
      home: HomeScreen(),
    );
  }
}
