import 'package:dsdsoft_project/components/secondary_button.dart';
import 'package:dsdsoft_project/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/appbar.dart';
import '../../providers/customer_provider.dart';

class CustomerDetailScreen extends ConsumerStatefulWidget {
  final int customerIndex;

  const CustomerDetailScreen({super.key, required this.customerIndex});

  @override
  ConsumerState<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends ConsumerState<CustomerDetailScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.customerIndex;
  }

  void _goPrev() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void _goNext(List customers) {
    if (currentIndex < customers.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final customers = ref.watch(customerProvider);

    // Handle case where customer list might be empty or index invalid
    if (customers.isEmpty || currentIndex >= customers.length) {
      return Scaffold(
        appBar: screensAppBar(context: context, title: 'Customer Details'),
        body: Center(child: Text('No customer data available')),
      );
    }

    final customer = customers[currentIndex];

    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: 'Customer Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              '#${currentIndex + 1}',
              style: titleText,
            ),
            SizedBox(height: 50),
            Text(
              customer.name,
              style: mainTitleText,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: primaryColor,
                ),
                Text(
                  ' ${customer.location}',
                  style: titleText.copyWith(
                    color: secondaryColor,
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
                  ' +91  ${customer.phone}',
                  style: formTitleText.copyWith(
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 65),
            Text(
              'VAT Number: ', // You can add real data later
              style: subtitleText,
            ),
            SizedBox(height: 5),
            Text(
              'Mode of Payment: ',
              style: subtitleText,
            ),
            SizedBox(height: 5),
            Text(
              'Credit Limit: ',
              style: subtitleText,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                SecondaryButton(
                  text: 'Prev',
                  onTap: currentIndex > 0 ? _goPrev : null,
                ),
                SizedBox(width: 10),
                SecondaryButton(
                  text: 'Next',
                  onTap: currentIndex < customers.length - 1
                      ? () => _goNext(customers)
                      : null,
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
