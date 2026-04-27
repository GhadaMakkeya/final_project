import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/features/managment/presentation/widgets/add_product_form_field.dart';

class InventorySection extends StatelessWidget {
  final TextEditingController skuController;
  final TextEditingController quantityController;

  const InventorySection({
    super.key,
    required this.skuController,
    required this.quantityController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inventory',
          style: TextStyle(
            fontFamily: AppFontFamilies.georgia,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4E4639),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'SKU',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
            color: Color(0xFF4E4639),
          ),
        ),
        const SizedBox(height: 8),
        ProductFormField(
          controller: skuController,
          hintText: 'Optional identifier',
        ),
        const SizedBox(height: 20),
        const Text(
          'AVAILABLE QUANTITY',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
            color: Color(0xFF4E4639),
          ),
        ),
        const SizedBox(height: 8),
        ProductFormField(
          controller: skuController,
          hintText: "ِAvailable quantity",
        ),
      ],
    );
  }
}
