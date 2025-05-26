import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/sales_report_model.dart';

// Provider for the Hive Box (open it lazily)
final salesReportBoxProvider = Provider<Box<SalesReportModel>>((ref) {
  throw UnimplementedError('Box not opened yet');
});

// StateNotifier to manage list of sales reports
class SalesReportNotifier extends StateNotifier<List<SalesReportModel>> {
  final Box<SalesReportModel> box;

  SalesReportNotifier(this.box) : super(box.values.toList());

  Future<void> addReport(SalesReportModel report) async {
    await box.add(report);
    state = box.values.toList(); // refresh state
  }

  Future<void> deleteReport(int index) async {
    await box.deleteAt(index);
    state = box.values.toList();
  }

  Future<void> updateReport(int index, SalesReportModel updated) async {
    await box.putAt(index, updated);
    state = box.values.toList();
  }

  // You can add update and other CRUD operations similarly
}

// Riverpod StateNotifierProvider
final salesReportProvider =
    StateNotifierProvider<SalesReportNotifier, List<SalesReportModel>>((ref) {
  final box = ref.watch(salesReportBoxProvider);
  return SalesReportNotifier(box);
});
