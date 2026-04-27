import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          obscureText: widget.isPassword ? obscure : false,
          decoration: InputDecoration(
            fillColor: Color(0xffF5F3F3),
            suffixIconColor: Color(0xffD1C5B4),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xffD1C5B4),
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
              style: TextStyle(color: Color(0xffD1C5B4)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
