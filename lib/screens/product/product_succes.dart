import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme/constants.dart';

class ProductSuccessScreen extends StatefulWidget {
  const ProductSuccessScreen({super.key});

  @override
  State<ProductSuccessScreen> createState() => _ProductSuccessScreenState();
}

class _ProductSuccessScreenState extends State<ProductSuccessScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  int playCount = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        playCount++;
        if (playCount < 2) {
          _animationController.forward(from: 0); // replay
        } else {
          Timer(const Duration(milliseconds: 300), () {
            if (mounted) Navigator.pop(context); // close after 2 plays
          });
        }
      }
    });

    // Start the animation with a slower speed
    _animationController.duration = const Duration(milliseconds: 1000); // slower
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/success.json',
              controller: _animationController,
              onLoaded: (composition) {
                _animationController.duration = composition.duration * 1.5;
              },
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Successfully Added!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
