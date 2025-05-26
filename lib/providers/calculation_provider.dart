import 'package:flutter_riverpod/flutter_riverpod.dart';

final quantityProvider = StateProvider<double>((ref) => 0);
final discountPercentProvider = StateProvider<double>((ref) => 0);
final salePriceProvider = StateProvider<double>((ref) => 0);

final subtotalProvider = Provider<double>((ref) {
  final qty = ref.watch(quantityProvider);
  final price = ref.watch(salePriceProvider);
  return qty * price;
});

final discountAmountProvider = Provider<double>((ref) {
  final subtotal = ref.watch(subtotalProvider);
  final discountPercent = ref.watch(discountPercentProvider);
  return subtotal * discountPercent / 100;
});

final vatProvider = Provider<double>((ref) {
  final subtotal = ref.watch(subtotalProvider);
  final discount = ref.watch(discountAmountProvider);
  return (subtotal - discount) * 0.15;
});

final totalProvider = Provider<double>((ref) {
  final subtotal = ref.watch(subtotalProvider);
  final discount = ref.watch(discountAmountProvider);
  final vat = ref.watch(vatProvider);
  return subtotal - discount + vat;
});
