import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/features/managment/presentation/widgets/add_product_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: AppTextStyles.sectionTitle
        ),
         SizedBox(height: 20.h),
        const Text(
          'SKU',
          style: AppTextStyles.fieldLabel
        ),
         SizedBox(height: 8.h),
        ProductFormField(
          controller: skuController,
          hintText: 'Optional identifier',
        ),
         SizedBox(height: 20.h),
        const Text(
          'AVAILABLE QUANTITY',
          style: AppTextStyles.fieldLabel
        ),
         SizedBox(height: 8.h),
        ProductFormField(
          controller: skuController,
          hintText: "ِAvailable quantity",
        ),
      ],
    );
  }
}
