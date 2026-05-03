import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/managment/presentation/widgets/basic_info_section.dart';
import 'package:veloura/features/managment/presentation/widgets/bottom_action_buttons.dart';
import 'package:veloura/features/managment/presentation/widgets/image_upload_scteion.dart';
import 'package:veloura/features/managment/presentation/widgets/inventory_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _productNameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _skuController = TextEditingController();
  final _quantityController = TextEditingController();

  String? _selectedCategory;

  void _onPublish() {}

  void _onSaveDraft() {}

  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _skuController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Add New Product', style: textTheme.titleLarge),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        // Image Upload
                        const ImageUploadSection(),
                        SizedBox(height: 28.h),
                        // Basic Information
                        BasicInformationSection(
                          productNameController: _productNameController,
                          priceController: _priceController,
                          descriptionController: _descriptionController,
                          selectedCategory: _selectedCategory,
                          onCategoryChanged: (value) =>
                              setState(() => _selectedCategory = value),
                        ),
                        SizedBox(height: 28.h),
                        // Inventory
                        InventorySection(
                          skuController: _skuController,
                          quantityController: _quantityController,
                        ),
                        SizedBox(height: 50.h),
                        BottomActionButtons(
                          onPublish: _onPublish,
                          onSaveDraft: _onSaveDraft,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
