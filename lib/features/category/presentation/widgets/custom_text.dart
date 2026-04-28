import 'package:flutter/material.dart';
import '../../../../core/constants/app_font_families.dart';
import '../../../../core/utils/responsive.dart';

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

  double responsiveFontSize(BuildContext context) {
    double screenWidth = Responsive.width(context);

    double scaleFactor = screenWidth / 375;

    double newSize = fontSize * scaleFactor;

    return newSize.clamp(fontSize * 0.8, fontSize * 1.2);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: responsiveFontSize(context),
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}