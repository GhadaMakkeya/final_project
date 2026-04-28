import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),

        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset(
            iconPath,
            width: 22,
            height: 22,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.facebook, color: Colors.blue, size: 22);
            },
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.playfairDisplay(
              fontSize: 14,
              color: Color(0xff44403C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
