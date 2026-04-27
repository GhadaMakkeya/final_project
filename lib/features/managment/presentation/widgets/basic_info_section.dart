import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/features/managment/presentation/widgets/add_product_form_field.dart';
import 'package:veloura/features/managment/presentation/widgets/category_dropdown_list.dart';

class BasicInformationSection extends StatelessWidget {
  final TextEditingController productNameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final String? selectedCategory;
  final ValueChanged<String?> onCategoryChanged;

  const BasicInformationSection({
    super.key,
    required this.productNameController,
    required this.priceController,
    required this.descriptionController,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Information',
          style: TextStyle(
            fontFamily: AppFontFamilies.georgia,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4E4639)
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "PRODUCT NAME",
          style: TextStyle(
            fontFamily: "Sans Serif",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4E4639)
          ),
        ),
        const SizedBox(height: 8),
        ProductFormField(
          controller: productNameController,
          hintText: 'e.g., The Minimalist Leather Tote',
          validator: (v) => (v == null || v.trim().isEmpty)
              ? 'Product name is required'
              : null,
        ),
        const SizedBox(height: 20),
        const Text(
          "CATEGORY",
          style: TextStyle(
            fontFamily: "Sans Serif",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4E4639)
          ),
        ),
        const SizedBox(height: 8),
        CategoryDropdown(value: selectedCategory, onChanged: onCategoryChanged),
        const SizedBox(height: 20),
        const Text(
          "PRICE (USD)",
          style: TextStyle(
            fontFamily: "Sans Serif",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4E4639),
          ),
        ),
        const SizedBox(height: 8),
        ProductFormField(
          controller: priceController,
          hintText: '0.00',
          prefixIcon: Icon(Icons.attach_money, size: 18,),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (v) {
            if (v == null || v.trim().isEmpty) return 'Price is required';
            if (double.tryParse(v) == null) return 'Enter a valid number';
            return null;
          },
        ),
        const SizedBox(height: 20),
        const Text(
          "DESCRPTION",
          style: TextStyle(
            fontFamily: "Sans Serif",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        ProductFormField(
          controller: descriptionController,
          hintText:
              'Describe the materials, craftsmanship, and design philosophy behind this piece...',
          maxLines: 5,
        ),
      ],
    );
  }
}
