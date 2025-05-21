import 'package:dsdsoft_project/screens/customer/add_customer_screen.dart';
import 'package:dsdsoft_project/screens/customer/customer_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../data/customer_details.dart';
import '../../theme/constants.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context); // Go back when tapped
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 20,
                  child: Icon(
                    Icons.arrow_back,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
              ),
              Text(
                'Customer',
                style: titleText,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCustomerScreen(),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add,
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 15),
            _searchField(),
            SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                  itemCount: customerDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    final customer = customerDetails[index];
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 0.7,
                          color: secondaryColor,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text('#${index + 1}', style: indexText),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(customer.name, style: subtitleText),
                                // SizedBox(height: 4),
                                Text(customer.location, style: bodyText),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_outlined,
                                      color: secondaryColor,
                                      size: 15,
                                    ),
                                    Text('+91 ${customer.phone}',
                                        style: bodyText),
                                  ],
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CustomerDetailScreen(
                                        customerIndex: index,
                                        name: customer.name,
                                        location: customer.location,
                                        phone: customer.phone,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      'View Detail',
                                      style: bodyText.copyWith(color: white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.7,
          )),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search_rounded,
            color: primaryColor,
          ),
          hintText: 'Search Customer',
          border: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
