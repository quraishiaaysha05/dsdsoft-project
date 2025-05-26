import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart'; // ✅ Import this

class BarcodeScannerScreen extends StatelessWidget {
  const BarcodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: MobileScanner(
        onDetect: (capture) {
          final barcode = capture.barcodes.first;
          final String? value = barcode.rawValue;

          if (value != null && context.mounted) {
            Navigator.pop(context, value); // ✅ Return scanned barcode
          }
        },
      ),
    );
  }
}
