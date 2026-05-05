import 'package:flutter/material.dart';
import 'package:veloura/features/managment/presentation/widgets/add_product_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventorySection extends StatelessWidget {
  final TextEditingController stockController;

  const InventorySection({
    super.key,
    required this.stockController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Inventory', style: textTheme.headlineSmall),
        SizedBox(height: 20.h),
        Text('SKU', style: textTheme.titleSmall),
        SizedBox(height: 8.h),
        ProductFormField(
          controller: stockController,
          hintText: 'Optional identifier',
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
