import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';
import 'package:veloura/features/managment/presentation/cubits/add_product_cubit.dart/cubit/add_product_cubit.dart';
import 'package:veloura/features/managment/presentation/cubits/add_product_cubit.dart/cubit/add_product_state.dart';
import 'package:veloura/features/managment/presentation/widgets/basic_info_section.dart';
import 'package:veloura/features/managment/presentation/widgets/bottom_action_buttons.dart';
import 'package:veloura/features/managment/presentation/widgets/inventory_section.dart';

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
  final _stockController = TextEditingController();
  final _coverPictureUrlController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _stockController.dispose();
    _coverPictureUrlController.dispose();
    super.dispose();
  }

  void _resetForm() {
    _productNameController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _stockController.clear();
    _coverPictureUrlController.clear();
    setState(() => _selectedCategory = null);
  }

  String _getErrorMessage(String error) {
    if (error.contains('404')) return "Server not found. Please try again later.";
    if (error.contains('400')) return "Invalid data. Please check your inputs.";
    if (error.contains('SocketException')) return "No internet connection.";
    return "An unexpected error occurred. Please try again.";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 10),
                  Text("Product added successfully!"),
                ],
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
          _resetForm();
        }

        if (state is AddProductError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _getErrorMessage(state.errMessage),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.red.shade800,
              duration: const Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              action: SnackBarAction(
                label: "DISMISS",
                textColor: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add New Product"),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  BasicInformationSection(
                    productNameController: _productNameController,
                    priceController: _priceController,
                    descriptionController: _descriptionController,
                    coverPictureUrlController: _coverPictureUrlController,
                    selectedCategory: _selectedCategory,
                    onCategoryChanged: (value) =>
                        setState(() => _selectedCategory = value),
                  ),
                  SizedBox(height: 20.h),
                  InventorySection(stockController: _stockController),
                  SizedBox(height: 40.h),
                  if (state is AddProductLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    BottomActionButtons(
                      onPublish: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        context.read<ProductCubit>().addProduct(
                          ProductModel(
                            name: _productNameController.text.trim(),
                            nameArabic: "منتج جديد",
                            price: double.tryParse(_priceController.text) ?? 0.0,
                            stock: int.tryParse(_stockController.text) ?? 0,
                            description: _descriptionController.text.trim(),
                            descriptionArabic: "وصف المنتج", 
                            categoryIds: [_selectedCategory!],
                            sellerId: "d051dbf3-f5d8-410d-0e50-08de06562562",
                            coverPictureUrl: _coverPictureUrlController.text.trim(),
                            color: "black",
                            discountPercentage: 0,
                            weight: 1.0,
                          ),
                        );
                      },
                    ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}