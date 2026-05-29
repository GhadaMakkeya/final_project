import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/home/presentation/cubits/categery_cubit/category_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart'; 
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_states.dart';
import 'package:veloura/features/products/presntation/widgets/categoey_list.dart';
import 'package:veloura/features/products/presntation/widgets/custom_product_item.dart';
import 'package:veloura/features/products/presntation/widgets/product_search_delegate.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProductsCubit>().getProducts();
    context.read<CategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: colors.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  allProducts: context.read<ProductsCubit>().allProducts,
                ),
              );
            },
            icon: Icon(Icons.search, color: colors.primary),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined, color: colors.primary),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<ProductsCubit>().getProducts(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const CategoryList(),
              Padding(
                padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 6.h),
                child: BlocBuilder<ProductsCubit, ProductsStates>(
                  builder: (context, state) {
                    if (state is ProductsLoadingState) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(50.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state is ProductsErrorState) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            state.errorMessage,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    if (state is ProductsSuccessState) {
                      final products = state.products;

                      if (products.isEmpty) {
                        return const Center(child: Text("No products found"));
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.53,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                            ),
                        itemBuilder: (context, index) {
                          return CustomProductItem(product: products[index]);
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}