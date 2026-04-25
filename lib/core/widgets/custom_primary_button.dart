import 'package:veloura/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double height;

  const CustomPrimaryButton({
    super.key,
    this.label = 'NEXT',
    required this.onPressed,
    this.width = double.infinity,
    this.height = 58,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1B2A4A),
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 3.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
