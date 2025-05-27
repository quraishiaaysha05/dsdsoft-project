import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SyncDataPage extends StatefulWidget {
  @override
  _SyncDataPageState createState() => _SyncDataPageState();
}

class _SyncDataPageState extends State<SyncDataPage> {
  final Color primaryGreen = Color(0xFF174809);

  final Map<String, bool> syncOptions = {
    'Customer': false,
    'Product': false,
    'Pricelist': false,
    'UOM': false,
    'Tax': false,
    'Order and Payment': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () {
          Navigator.pop(context);
        },
        ),
        title: Text(
          'Sync Data',
          style: TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...syncOptions.keys.map(
              (key) => CheckboxListTile(
                title: Text(key, style: TextStyle(fontSize: 16)),
                value: syncOptions[key],
                onChanged: (bool? value) {
                  setState(() {
                    syncOptions[key] = value ?? false;
                  });
                },
                activeColor: primaryGreen,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    final selected =
                        syncOptions.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Selected: ${selected.join(', ')}"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
