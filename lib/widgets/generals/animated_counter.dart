import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter(
      {required this.value, required this.primaryColor, super.key});

  final double value;
  final MaterialColor primaryColor;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: value),
      duration: const Duration(seconds: 3),
      builder: (context, value, child) => Text(value.toStringAsFixed(2),
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor),
          textAlign: TextAlign.center),
    );
  }
}
