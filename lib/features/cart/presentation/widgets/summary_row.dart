import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

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
    this.labelFontSize,
    this.valueFontSize,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isBold
                ? textTheme.headlineSmall
                : textTheme.bodyLarge?.copyWith(color: colors.textSecondary),
          ),
          Text(
            value,
            style: isBold
                ? textTheme.headlineSmall
                : textTheme.bodyLarge?.copyWith(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
