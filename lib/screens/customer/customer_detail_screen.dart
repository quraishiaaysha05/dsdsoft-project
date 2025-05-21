import 'package:dsdsoft_project/components/main_button.dart';
import 'package:dsdsoft_project/components/secondary_button.dart';
import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatefulWidget {
  final int customerIndex;
  final String name;
  final String location;
  final String phone;

  const CustomerDetailScreen({
    super.key,
    required this.customerIndex,
    required this.name,
    required this.location,
    required this.phone,
  });

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
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
            SizedBox(width: 18),
            Text(
              'Customer Details',
              style: titleText,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              '#${widget.customerIndex + 1}',
              style: subtitleText,
            ),
            SizedBox(height: 50),
            Text(
              widget.name,
              style: titleText,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: primaryColor,
                ),
                Text(
                  ' ${widget.location}',
                  style: formTitleText.copyWith(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: primaryColor,
                ),
                Text(
                  ' +91 ${widget.phone}',
                  style: formTitleText.copyWith(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 65),
            Text(
              'VAT Number: ',
              style: indexText.copyWith(color: primaryColor),
            ),
            SizedBox(height: 5),
            Text(
              'Mode of Payment: ',
              style: indexText.copyWith(color: primaryColor),
            ),
            SizedBox(height: 5),
            Text(
              'Credit Limit: ',
              style: indexText.copyWith(color: primaryColor),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                SecondaryButton(text: 'Prev'),
                SizedBox(width: 10),
                SecondaryButton(text: 'Next'),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
