import 'package:flutter/material.dart';

import '../../../../core/constants/app_font_families.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color color;
  final double letterSpacing;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = AppFontFamilies.georgia,
    this.color = Colors.black,
    this.letterSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}