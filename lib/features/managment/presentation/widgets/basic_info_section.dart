import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/features/managment/presentation/widgets/add_product_form_field.dart';
import 'package:veloura/features/managment/presentation/widgets/category_dropdown_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        const Text('Basic Information', style: AppTextStyles.sectionTitle),
         SizedBox(height: 20.h),
        const Text("PRODUCT NAME", style: AppTextStyles.fieldLabel),
         SizedBox(height: 8.h),
        ProductFormField(
          controller: productNameController,
          hintText: 'e.g., The Minimalist Leather Tote',
          validator: (v) => (v == null || v.trim().isEmpty)
              ? 'Product name is required'
              : null,
        ),
         SizedBox(height: 20.h),
        const Text("CATEGORY", style: AppTextStyles.fieldLabel),
         SizedBox(height: 8.h),
        CategoryDropdown(value: selectedCategory, onChanged: onCategoryChanged),
         SizedBox(height: 20),
        const Text("PRICE (USD)", style: AppTextStyles.fieldLabel),
         SizedBox(height: 8.h),
        ProductFormField(
          controller: priceController,
          hintText: '0.00',
          prefixIcon: Icon(Icons.attach_money, size: 18),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (v) {
            if (v == null || v.trim().isEmpty) return 'Price is required';
            if (double.tryParse(v) == null) return 'Enter a valid number';
            return null;
          },
        ),
        const SizedBox(height: 20),
        const Text("DESCRPTION", style: AppTextStyles.fieldLabel),
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
