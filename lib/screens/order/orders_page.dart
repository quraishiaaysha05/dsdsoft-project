import 'package:dsdsoft_project/screens/Order/new_order_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color primaryGreen = Color(0xFF174809);

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: primaryGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
          Navigator.pop(context);
        },
          tooltip: 'Home',
        ),
        //Add icon
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF174809), // Green background
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ), // White plus icon
              onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => NewOrderPage(),
                          ),
                        ),
              tooltip: 'New Order',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Orders',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Orders List
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const OrderTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date Label
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: primaryGreen,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '04 May 2025',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        // Order Box
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF174809)),
            borderRadius: BorderRadius.circular(12),
          ),

          child: Row(
            children: [
              const Checkbox(value: false, onChanged: null),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('#25484', style: TextStyle(color: Colors.black)),
                  Text(
                    'Al-Ansari Perfumes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
