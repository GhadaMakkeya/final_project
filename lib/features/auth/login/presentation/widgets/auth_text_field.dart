import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xffA8A29E),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(
              widget.icon,
              color: const Color(0xffA8A29E),
              size: 20,
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFFD1C5B4),
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
            fillColor: const Color(0xFFFDFAFA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
      ],
    );
  }
}
