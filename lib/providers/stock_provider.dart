import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockItem {
  final String product;
  final String barcode;
  final int quantity;

  StockItem({
    required this.product,
    required this.barcode,
    required this.quantity,
  });
}

// This can be StateNotifier or just a simple Provider returning list
final stockItemsProvider = StateProvider<List<StockItem>>((ref) {
  // Your initial stock list here, or empty
  return [
    StockItem(product: 'Milk 1L', barcode: '1234567890123', quantity: 10),
    StockItem(product: 'Bread Loaf', barcode: '2345678901234', quantity: 5),
  ];
});
