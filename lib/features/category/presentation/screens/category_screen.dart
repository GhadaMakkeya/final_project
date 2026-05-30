import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/utils/responsive.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/category/presentation/products_filtered_cubit/products_filtered_cubit.dart';
import 'package:veloura/features/category/presentation/products_filtered_cubit/products_filtered_state.dart';
import '../widgets/custom_text.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatefulWidget {
    final String categoryName; 

  const CategoryScreen({super.key, required this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
   @override
  void initState() {
    super.initState();
    context.read<ProductsFilterByCategoryCubit>().filterProducts(
      categoryName: widget.categoryName,
    );
  }
  @override
  Widget build(BuildContext context) {
    final width = Responsive.width(context);
    final height = Responsive.height(context);
    final colors = context.colors;

    final crossAxisCount = width > 1200
        ? 4
        : width > 900
        ? 3
        : width > 600
        ? 1
        : 1;

    return BlocBuilder<ProductsFilterByCategoryCubit, ProductsFilterByCategoryState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colors.background,
          appBar: const CustomAppBar(),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),

                  /// COLLECTION
                  CustomText(
                    text: AppStrings.collection,
                    fontSize: 12,
                    color: colors.textSecondary,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),

                  SizedBox(height: height * 0.01),

                  /// TITLE
                  CustomText(
                    text: widget.categoryName,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: colors.textPrimary,
                    letterSpacing: 2,
                  ),

                  SizedBox(height: height * 0.015),
                  Divider(thickness: 0.2, color: colors.border),
                  SizedBox(height: height * 0.01),

                  /// FILTERS
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: width * 0.08,
                    children: [
                      /// FILTER
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.tune,
                            size: width * 0.05,
                            color: colors.textSecondary,
                          ),
                          SizedBox(width: width * 0.02),
                          CustomText(
                            text: AppStrings.filter,
                            fontSize: 12,
                            color: colors.textSecondary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ],
                      ),

                      /// SORT
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.swap_vert,
                            size: width * 0.05,
                            color: colors.textSecondary,
                          ),
                          SizedBox(width: width * 0.02),
                          CustomText(
                            text: AppStrings.sort,
                            fontSize: 11,
                            color: colors.textSecondary,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.01),

                  /// COUNT
                  CustomText(
                    text: AppStrings.itemsCount(
                      state is ProductsFilterSuccess ? state.products.length : 0,
                    ),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: colors.textTertiary,
                  ),

                  SizedBox(height: height * 0.01),
                  Divider(thickness: 0.2, color: colors.border),
                  SizedBox(height: height * 0.015),

                  /// BODY
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        /// LOADING
                        if (state is ProductsFilterLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        
                        /// ERROR
                        if (state is ProductsFilterError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(color: colors.textPrimary),
                            ),
                          );
                        }
                        
                        /// SUCCESS
                        if (state is ProductsFilterSuccess) {
                          return GridView.builder(
                            padding: EdgeInsets.only(bottom: height * 0.02),
                            itemCount: state.products.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: width * 0.03,
                              mainAxisSpacing: height * 0.015,
                              childAspectRatio: width < 400
                                  ? 1
                                  : width < 700
                                  ? 1
                                  : 1,
                            ),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: state.products[index],
                              );
                            },
                          );
                        }
                        
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}