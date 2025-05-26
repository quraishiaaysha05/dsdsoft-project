import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/customer_model.dart';
import 'search_provider.dart'; // ✅ needed for filtering

class CustomerNotifier extends StateNotifier<List<Customer>> {
  final Box<Customer> _customerBox;

  CustomerNotifier(this._customerBox) : super(_customerBox.values.toList());

  void addCustomer(Customer customer) {
    _customerBox.add(customer);
    state = _customerBox.values.toList();
  }

  void updateCustomer(int index, Customer updatedCustomer) {
    if (index >= 0 && index < _customerBox.length) {
      final key = _customerBox.keyAt(index);
      _customerBox.put(key, updatedCustomer);
      state = _customerBox.values.toList();
    }
  }

  void removeCustomer(int index) {
    if (index >= 0 && index < _customerBox.length) {
      final key = _customerBox.keyAt(index);
      _customerBox.delete(key);
      state = _customerBox.values.toList();
    }
  }
}

final customerBoxProvider = Provider<Box<Customer>>((ref) {
  throw UnimplementedError();
});

final customerProvider = StateNotifierProvider<CustomerNotifier, List<Customer>>((ref) {
  final box = ref.watch(customerBoxProvider);
  return CustomerNotifier(box);
});

/// ✅ Filtered provider using search term
final filteredCustomerProvider = Provider<List<Customer>>((ref) {
  final customers = ref.watch(customerProvider);
  final search = ref.watch(searchTermProvider).toLowerCase();

  return customers.where((customer) {
    return customer.name.toLowerCase().contains(search) ||
           customer.phone.toLowerCase().contains(search);
  }).toList();
});
