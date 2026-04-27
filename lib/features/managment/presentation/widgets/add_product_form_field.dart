import 'package:flutter/material.dart';

class ProductFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? prefixIcon;
  final int maxLines;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const ProductFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: Color.fromARGB(255, 121, 95, 68),
      style: const TextStyle(fontSize: 13, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: Color(0xFF4E4639),
        hintStyle: const TextStyle(color: Color.fromARGB(255, 121, 95, 68), fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(255, 121, 95, 68), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(255, 121, 95, 68), width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 251, 248, 245),
      ),
    );
  }
}
