import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final IconData? trailingIcon;
  final double borderRadius;
  final double letterSpacing;

  const CustomPrimaryButton({
    super.key,
    this.label = 'NEXT',
    required this.onPressed,
    this.width = double.infinity,
    this.height = 58,
    this.trailingIcon,
    this.borderRadius = 4,
    this.letterSpacing = 3.5,
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
            backgroundColor: const Color(0xFF061F3D), // Used AppColors.primary equivalent
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: letterSpacing,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 8),
                Icon(
                  trailingIcon,
                  size: 18,
                  color: Colors.white,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
