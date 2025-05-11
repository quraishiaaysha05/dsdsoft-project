import 'package:dsdsoft_project/screens/async_screen.dart';
import 'package:dsdsoft_project/screens/customer_screen.dart';
import 'package:dsdsoft_project/screens/item_sales_screen.dart';
import 'package:dsdsoft_project/screens/order_screen.dart';
import 'package:dsdsoft_project/screens/payment_screen.dart';
import 'package:dsdsoft_project/screens/product_screen.dart';
import 'package:dsdsoft_project/screens/return_screen.dart';
import 'package:dsdsoft_project/screens/sales_report_screen.dart';
import 'package:dsdsoft_project/screens/stock_report_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _gridItems = [
    [Icons.circle, 'Order', OrderScreen()],
    [Icons.circle, 'Payment', PaymentScreen()],
    [Icons.circle, 'Return', ReturnScreen()],
    [Icons.circle, 'Product', ProductScreen()],
    [Icons.circle, 'Customer', CustomerScreen()],
    [Icons.circle, 'Async', AsyncScreen()],
    [Icons.circle, 'Stock Report', StockReportScreen()],
    [Icons.circle, 'Sales Report', SalesReportScreen()],
    [Icons.circle, 'Item Sales', ItemSalesScreen()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Business Hub',
                        style: TextStyle(fontSize: 28),
                      ),
                      Icon(Icons.more_vert, size: 28),
                    ],
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: _gridItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: _gridItems[index][2])),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[300],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(_gridItems[index][0]),
                              Text(
                                _gridItems[index][1],
                                style: TextStyle(
                                    fontSize: 26,
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
