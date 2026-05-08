import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';

class CustomPassTextField extends StatefulWidget {
  const CustomPassTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
    required this.prefixIcon,
  });
  final String label;
  final String hintText;
  final bool isPassword;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<CustomPassTextField> createState() => _CustomPassTextFieldState();
}

class _CustomPassTextFieldState extends State<CustomPassTextField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormField(
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          obscureText: widget.isPassword ? obscure : false,
          cursorColor: colors.primary,
          style: textTheme.bodyMedium?.copyWith(color: colors.primary),
          decoration: InputDecoration(
            fillColor: colors.secondary,
            prefixIcon: Icon(
              widget.prefixIcon,
              color: colors.textTertiary,
              size: 20,
            ),
            suffixIconColor: colors.textTertiary,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: colors.textTertiary,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  )
                : null,
            hint: Text(
              widget.hintText,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.textTertiary, // ← was hardcoded
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: BaseColors.alert, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: BaseColors.alert, width: 1.5),
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
