
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({
    super.key,
    required this.width,
    required this.isMale, 
    required this.backgroundColor,

  });

  final double width;
  final bool isMale;
  final Color backgroundColor ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(isMale ? FontAwesomeIcons.mars : FontAwesomeIcons.venus, color : Colors.white, size : 60),
          Text(isMale ?"Male":"Female",style:TitleTextStyle,),
        ],
      ),
      width : width * 0.47,
      height : width * 0.47,
      decoration: BoxDecoration(
        color : backgroundColor,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}