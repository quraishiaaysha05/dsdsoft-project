import 'package:dsdsoft_project/screens/sync_screen.dart';
import 'package:dsdsoft_project/screens/customer/customer_screen.dart';
import 'package:dsdsoft_project/screens/item_sales.dart/item_sales_screen.dart';
import 'package:dsdsoft_project/screens/order_screen.dart';
import 'package:dsdsoft_project/screens/payment_screen.dart';
import 'package:dsdsoft_project/screens/product/product_screen.dart';
import 'package:dsdsoft_project/screens/return_screen.dart';
import 'package:dsdsoft_project/screens/sales_report/sales_report_screen.dart';
import 'package:dsdsoft_project/screens/stock_report.dart/stock_report_screen.dart';
import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _gridItems = [
    ['order.png', 'Order', OrderScreen()],
    ['payment1.png', 'Payment', PaymentScreen()],
    ['return2.png', 'Return', ReturnScreen()],
    ['product1.png', 'Product', ProductScreen()],
    ['customer1.png', 'Customer', CustomerScreen()],
    ['sync1.png', 'Sync', SyncScreen()],
    ['stock_report2.png', 'Stock Report', StockReportScreen()],
    ['sales_report.png', 'Sales Report', SalesReportScreen()],
    ['item_sales.png', 'Item Sales', ItemSalesScreen()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                        style: mainTitleText,
                      ),
                      Icon(Icons.more_vert, size: 28, color: primaryColor,),
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
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _gridItems[index][2],
                          ),
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: softGray,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(_gridItems[index][0]),
                              Image.asset(
                                'assets/home_icons/${_gridItems[index][0]}',
                                height: 65,
                              ),
                              Text(
                                _gridItems[index][1],
                                style: mainTitleText,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
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
