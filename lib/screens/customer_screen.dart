import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  CustomerScreen({super.key});

  List customerDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Customer'),
            Icon(Icons.add),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          _SearchField(),
          ListView.builder(itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  for (int i = 1; i < 5; i++) Text('$i'),
                  Column(
                    children: [
                      Text('name'),
                      Text('location'),
                      Text('phone no'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text('View Detail'),
                      )
                    ],
                  )
                ],
              ),
            );
          })
        ],
      )),
    );
  }

  Container _SearchField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search_rounded),
          hintText: 'Search Customer',
          border: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
