import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/appbar.dart';
import '../../providers/stock_provider.dart';
import '../../theme/constants.dart';

class StockReportScreen extends ConsumerWidget {
  const StockReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockItems = ref.watch(stockItemsProvider); // 👈 use Riverpod

    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: 'Stock Report',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: Text('Product', style: subtitleText.copyWith(color: white))),
                  Expanded(child: Text('Barcode', style: subtitleText.copyWith(color: white))),
                  Text('Qty', style: subtitleText.copyWith(color: white)),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: stockItems.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final item = stockItems[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(child: Text(item.product, style: stockList)),
                        Expanded(child: Text(item.barcode, style: stockList)),
                        Text(item.quantity.toString(), style: stockList),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
