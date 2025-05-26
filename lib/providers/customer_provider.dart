// lib/providers/customer_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/customer_model.dart';

// Define a StateNotifier to manage the list of customers
class CustomerNotifier extends StateNotifier<List<Customer>> {
  CustomerNotifier() : super([]);

  // Add a new customer
  void addCustomer(Customer customer) {
    state = [...state, customer];
  }

  // Update a customer by index
  void updateCustomer(int index, Customer updatedCustomer) {
    final List<Customer> newList = [...state];
    if (index >= 0 && index < newList.length) {
      newList[index] = updatedCustomer;
      state = newList;
    }
  }

  // Remove a customer by index
  void removeCustomer(int index) {
    final List<Customer> newList = [...state];
    if (index >= 0 && index < newList.length) {
      newList.removeAt(index);
      state = newList;
    }
  }
}

// Create the provider
final customerProvider = StateNotifierProvider<CustomerNotifier, List<Customer>>((ref) {
  return CustomerNotifier();
});
