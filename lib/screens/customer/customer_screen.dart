import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/appbar.dart';
import '../../components/search_field.dart';
import '../../providers/customer_provider.dart';
import '../../providers/search_provider.dart';
import '../../screens/customer/add_customer_screen.dart';
import '../../screens/customer/customer_detail_screen.dart';
import '../../theme/constants.dart';

class CustomerScreen extends ConsumerWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customerProvider); // original list
    final filteredCustomers = ref.watch(filteredCustomerProvider); // filtered list

    return Scaffold(
      backgroundColor: white,
      appBar: screensAppBar(
        context: context,
        title: 'Customer',
        showAction: true,
        destination: const AddCustomerScreen(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 15),
              SearchField(
                hintText: 'Customer',
                onChanged: (value) =>
                    ref.read(searchTermProvider.notifier).state = value,
              ),
              const SizedBox(height: 18),
              Expanded(
                child: filteredCustomers.isEmpty
                    ? const Center(child: Text('No customers found.'))
                    : ListView.builder(
                        itemCount: filteredCustomers.length,
                        itemBuilder: (context, index) {
                          final customer = filteredCustomers[index];
                          final actualIndex = customers.indexOf(customer);

                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 0.7, color: secondaryColor),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text(
                                    '#${actualIndex + 1}',
                                    style: subtitleText,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(customer.name, style: titleText),
                                      Text(customer.location, style: bodyText),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(Icons.phone_outlined,
                                              color: secondaryColor, size: 15),
                                          Text('+91 ${customer.phone}',
                                              style: bodyText),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerDetailScreen(
                                                      customerIndex:
                                                          actualIndex),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Text('View Detail',
                                              style: bodyText.copyWith(
                                                  color: white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
