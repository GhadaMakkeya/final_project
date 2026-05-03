import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.fieldName,
    required this.hintName,
    this.isPassword = false,
  });
  final String fieldName;
  final String hintName;
  final bool isPassword;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.fieldName, style: textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormField(
          obscureText: widget.isPassword ? obscure : false,
          cursorColor: colors.primary,
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            fillColor: colors.secondary,
            suffixIconColor: colors.textTertiary,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: colors.textTertiary,
                    ),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  )
                : null,
            hint: Text(
              widget.hintName,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.textTertiary, // ← was hardcoded
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: colors.primary, width: 1.2),
            ),
            filled: true,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
