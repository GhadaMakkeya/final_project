import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label, value;
  final bool isBold;
  final double? labelFontSize;
  final double? valueFontSize;
  final String? fontFamily;
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
    this.labelFontSize = 16,
    this.valueFontSize = 16,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: labelFontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Color(0xFF4E4639),
              fontFamily: fontFamily,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Color(0xFF4E4639),
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
