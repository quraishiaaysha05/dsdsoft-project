class StockItem {
  final String product;
  final String barcode;
  final int quantity;

  StockItem({
    required this.product,
    required this.barcode,
    required this.quantity,
  });

  factory StockItem.fromMap(Map<String, dynamic> map) {
    return StockItem(
      product: map['product'] ?? '',
      barcode: map['barcode'] ?? '',
      quantity: map['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'barcode': barcode,
      'quantity': quantity,
    };
  }
}
