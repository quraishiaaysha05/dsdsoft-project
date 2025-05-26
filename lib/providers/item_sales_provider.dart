import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/item_sales_model.dart';

final itemSalesBoxProvider = Provider<Box<ItemSalesModel>>((ref) {
  throw UnimplementedError('Box not initialized');
});

class ItemSalesNotifier extends StateNotifier<List<ItemSalesModel>> {
  final Box<ItemSalesModel> box;

  ItemSalesNotifier(this.box) : super(box.values.toList());

  Future<void> addItemSale(ItemSalesModel sale) async {
    await box.add(sale);
    state = box.values.toList(); // refresh
  }
}

final itemSalesProvider =
    StateNotifierProvider<ItemSalesNotifier, List<ItemSalesModel>>((ref) {
  final box = ref.watch(itemSalesBoxProvider);
  return ItemSalesNotifier(box);
});
