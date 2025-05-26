import 'package:hive/hive.dart';
import '../models/stock_item_model.dart';

class StockService {
  final Box _stockBox = Hive.box('stockBox');

  List<StockItem> getStockItems() {
    return _stockBox.values
        .map((e) => StockItem.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  void saveStockItem(StockItem item) {
    _stockBox.add(item.toMap());
  }
}
