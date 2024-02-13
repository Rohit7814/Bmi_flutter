
import 'package:bmi/bmicalculatorsceen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home : BmiCalculatorScreen(),
    );
  }
}