import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/features/products/presentation/widgets/basic_info_section.dart';
import 'package:veloura/features/products/presentation/widgets/bottom_action_buttons.dart';
import 'package:veloura/features/products/presentation/widgets/image_upload_scteion.dart';
import 'package:veloura/features/products/presentation/widgets/inventory_section.dart';

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 248, 245),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 248, 245),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add New Product',
          style: TextStyle(
            fontFamily: AppFontFamilies.georgia,
            color: Color(0xFF4E4639),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        // Image Upload
                        const ImageUploadSection(),
                        const SizedBox(height: 28),
                        // Basic Information
                        BasicInformationSection(
                          productNameController: _productNameController,
                          priceController: _priceController,
                          descriptionController: _descriptionController,
                          selectedCategory: _selectedCategory,
                          onCategoryChanged: (value) =>
                              setState(() => _selectedCategory = value),
                        ),
                        const SizedBox(height: 28),
                        // Inventory
                        InventorySection(
                          skuController: _skuController,
                          quantityController: _quantityController,
                        ),
                        const SizedBox(height: 50),
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
