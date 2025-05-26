import 'package:hive/hive.dart';
part 'sales_report_model.g.dart';

@HiveType(typeId: 2)
class SalesReportModel extends HiveObject {
  @HiveField(0)
  String customer;

  @HiveField(1)
  DateTime fromDate;

  @HiveField(2)
  DateTime toDate;

  @HiveField(3)
  String dsdId;

  @HiveField(4)
  String? type;

  SalesReportModel({
    required this.customer,
    required this.fromDate,
    required this.toDate,
    required this.dsdId,
    this.type,
  });
}
