import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key,required this.bmi});

  final double bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Bmi Result',style: TitleTextStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body:Center(child: Text('${bmi.toStringAsFixed(2)}',style: TitleTextStyle.copyWith(fontSize: 50),))
    );
  }
}