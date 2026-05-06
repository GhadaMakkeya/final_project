import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/category/presentation/controller/category_cubit.dart';
import 'package:veloura/features/category/presentation/screens/category_screen.dart';
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_states.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_states.dart';
import 'package:veloura/features/home/presentation/widgets/custom_category_item.dart';
import 'package:veloura/features/home/presentation/widgets/custom_offer_item.dart';
import 'package:veloura/features/home/presentation/widgets/custom_product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // جلب كل البيانات عند بدء الشاشة
    context.read<ProductsCubit>().getProducts();
    context.read<OffersCubit>().getOffers();
    
    final categoryCubit = context.read<CategoryCubit>();
    if (categoryCubit.categoriesList.isEmpty) {
      categoryCubit.getAllCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.appName,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: colors.primary),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: colors.primary),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<ProductsCubit>().getProducts();
          await context.read<OffersCubit>().getOffers();
          await context.read<CategoryCubit>().getAllCategories();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. Featured Offers Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured Offers", style: textTheme.headlineSmall),
                  TextButton(
                    onPressed: () {},
                    child: Text("SEE ALL", style: textTheme.labelMedium),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              BlocBuilder<OffersCubit, OffersStates>(
                builder: (context, state) {
                  if (state is OffersLoadingState) {
                    return SizedBox(height: 180.h, child: const Center(child: CircularProgressIndicator()));
                  } else if (state is OffersSuccessState) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 180.h,
                          child: PageView.builder(
                            onPageChanged: (index) => setState(() => currentPage = index),
                            itemCount: state.offers.length,
                            itemBuilder: (context, index) => CustomOfferIteam(offersData: state.offers[index]),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(state.offers.length, (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: currentPage == index ? 12 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: currentPage == index ? colors.chipSelectedColor : Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),

              SizedBox(height: 30.h),

              // --- 2. Categories Section ---
              Text("Categories", style: textTheme.headlineSmall),
              SizedBox(height: 15.h),
              SizedBox(
                height: 45.h,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategorySuccess) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return CustomCategoryItem(
                            categoryModel: state.categories[index],
                            index: index,
                            onTap: () {
                              context.read<CategoryCubit>().selectCategoryByIndex(index);
                              
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  CategoryScreen()),
                              );
                            },
                          );
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),

              SizedBox(height: 25.h),

              // --- 3. Products Section ---
              Text("Recommended for you", style: textTheme.headlineSmall),
              SizedBox(height: 15.h),
              BlocBuilder<ProductsCubit, ProductsStates>(
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductsSuccessState) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) => CustomProductCard(product: state.products[index]),
                    );
                  } else if (state is ProductsErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}