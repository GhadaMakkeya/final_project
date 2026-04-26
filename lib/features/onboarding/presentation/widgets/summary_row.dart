import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label, value;
  final bool isBold;
  final double? labelFontSize;
  final double? valueFontSize;
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false, 
    this.labelFontSize,
     this.valueFontSize,
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
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
