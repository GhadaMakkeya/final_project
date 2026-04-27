// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final Color color;
  final Color buttonTextColor;
  final Color borderColor;
  final IconData? trailingIcon;
  final double borderRadius;
  final double letterSpacing;

  const CustomPrimaryButton({
    Key? key,
    this.label = 'NEXT',
    required this.onPressed,
    this.width = double.infinity,
    this.height = 58,
    this.color = const Color(0xFF1B2A4A),
    this.buttonTextColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.trailingIcon,
    this.borderRadius = 4,
    this.letterSpacing = 3.5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black26,
          side: BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),     
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}