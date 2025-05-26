import 'package:hive/hive.dart';

part 'product_model.g.dart';  // Generated adapter file

@HiveType(typeId: 4)  // Assign a unique typeId for Product
class Product extends HiveObject {
  @HiveField(0)
  final String barcode;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String basicUOM;

  @HiveField(3)
  final String salesUOM;

  @HiveField(4)
  final double salePrice;

  Product({
    required this.barcode,
    required this.name,
    required this.basicUOM,
    required this.salesUOM,
    required this.salePrice,
  });
}
