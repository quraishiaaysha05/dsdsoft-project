// Aaysha
// Customer 
// Product 
// Stock Report 
// Sales Report 
// Item Sales

import 'package:dsdsoft_project/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSD Soft',
      
      home: HomeScreen(),
    );
  }
}
