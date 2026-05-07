import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    super.key,
    required this.label,
    required this.hint,
    required this.maxLines,
  });
  final String label;
  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.titleSmall),
        SizedBox(height: 10),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: AppColors.lightColors.authCardColor,
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.lightColors.textTertiary),
            border: UnderlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.lightColors.primary,
                width: 1.2,
              ),
            ),
            filled: true,
          ),
        ),
      ],
    );
  }
}
