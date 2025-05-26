import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/stock_report_item.dart';

// Replace static list with this provider
final stockItemsProvider = Provider<List<StockItem>>((ref) {
  return [
    StockItem(product: "Arjoon Ajwa Seeds Power 150 gms", barcode: "6281106253680", quantity: 10),
    StockItem(product: "Arjoon Ajwa Seeds Power 200 gms", barcode: "6281106253681", quantity: 5),
    StockItem(product: "Arjoon Ajwa Seeds Power 100 gms", barcode: "6281106253682", quantity: 0),
    // Add more items as needed
  ];
});
