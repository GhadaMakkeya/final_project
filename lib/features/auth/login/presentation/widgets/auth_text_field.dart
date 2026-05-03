import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';

class AuthField extends StatefulWidget {
  // حولناه لـ StatefulWidget
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const AuthField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: textTheme.titleSmall),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(color: colors.textTertiary),
            prefixIcon: Icon(widget.icon, color: colors.textTertiary, size: 20),

            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: colors.textSecondary,
                      size: 20,
                    ),
                    onPressed: () {
                      // لما بنضغط بنعكس الحالة
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,

            filled: true,
            fillColor: colors.cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: colors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: colors.border),
            ),
          ),
        ),
      ],
    );
  }
}
