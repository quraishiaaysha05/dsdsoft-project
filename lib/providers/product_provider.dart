import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/product_model.dart';
import 'search_provider.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(int index) {
    final newList = [...state]..removeAt(index);
    state = newList;
  }

  void clearProducts() {
    state = [];
  }
}

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});

final filteredProductProvider = Provider<List<Product>>((ref) {
  final allProducts = ref.watch(productProvider);
  final searchTerm = ref.watch(searchTermProvider).toLowerCase();

  if (searchTerm.isEmpty) return allProducts;

  return allProducts
      .where((product) => product.name.toLowerCase().contains(searchTerm))
      .toList();
});

final productBoxProvider = Provider<Box<Product>>((ref) {
  throw UnimplementedError('productBoxProvider must be overridden');
});