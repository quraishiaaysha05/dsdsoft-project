import 'package:hive/hive.dart';

part 'item_sales_model.g.dart'; // Required for code generation

@HiveType(typeId: 1)
class ItemSalesModel extends HiveObject {
  @HiveField(0)
  String customer;

  @HiveField(1)
  String item;

  @HiveField(2)
  DateTime fromDate;

  @HiveField(3)
  DateTime toDate;

  @HiveField(4)
  String type;

  ItemSalesModel({
    required this.customer,
    required this.item,
    required this.fromDate,
    required this.toDate,
    required this.type,
  });
}
