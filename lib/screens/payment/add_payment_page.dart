import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../home/home_screen.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  @override
  _AddPaymentPageState createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  final _paymentIdController = TextEditingController(
    text: "Payment not synced",
  );
  final _dateController = TextEditingController();
  final _customerController = TextEditingController();
  final _balanceController = TextEditingController();

  final Color primaryColor = Color(0xFF174809);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Payment',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home, color: primaryColor),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: primaryColor),
            onPressed: () {
          Navigator.pop(context);
        },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabel('Payment Id'),
            buildInputField(_paymentIdController),
            buildLabel('Date'),
            buildDatePickerField(),
            buildLabel('Customer'),
            buildInputField(_customerController),
            buildLabel('Balance'),
            buildInputField(_balanceController),
            SizedBox(height: 16),
            buildButton(
              'Clear',
              onTap: () {
                _customerController.clear();
                _balanceController.clear();
              },
            ),
            SizedBox(height: 24),
            paymentCard(),
            SizedBox(height: 24),
            Text(
              'Total Amount:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildButton('Add', onTap: () {}),
                buildButton('Cancel', onTap: () => Navigator.pop(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget buildInputField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget buildDatePickerField() {
    return TextField(
      controller: _dateController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'DD-MM-YYYY',
        suffixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          _dateController.text = DateFormat('dd MMM yyyy').format(picked);
        }
      },
    );
  }

  Widget buildButton(String text, {required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget paymentCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text("04 May 2025", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.description, color: primaryColor),
                SizedBox(width: 10),
                Text(
                  '251',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Amount: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  TextSpan(text: '₹ 1200'),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Paid Amount: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  TextSpan(text: '₹ 800'),
                ],
              ),
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildButton("Select for Payment", onTap: () {}),
                Text("Due", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
