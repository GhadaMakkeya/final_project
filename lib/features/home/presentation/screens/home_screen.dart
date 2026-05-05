import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/features/category/presentation/screens/category_screen.dart';
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_states.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_states.dart';
import 'package:veloura/features/home/data/models/offers_data.dart';
import 'package:veloura/features/home/data/models/product_data_model.dart';
import 'package:veloura/features/home/presentation/widgets/custom_category_item.dart';
import 'package:veloura/features/home/presentation/widgets/custom_offer_item.dart';
import 'package:veloura/features/home/presentation/widgets/custom_product_card.dart';
import 'package:veloura/features/managment/presentation/cubits/categery_cubit/cubit/category_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();
    BlocProvider.of<OffersCubit>(context).getOffers();
    final categoryCubit = context.read<CategoryCubit>();
    if (categoryCubit.categories.isEmpty) {
      categoryCubit.getAllCategories();
    }
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Scaffold(
      //-------------AppBar------------
      appBar: CustomAppBar(
        title: AppStrings.appName,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: colors.primary),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none, color: colors.primary),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //----------featured offers---------
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
              SizedBox(height: 8),
              BlocBuilder<OffersCubit, OffersStates>(
                builder: (context, state) {
                  if (state is OffersLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if ((state is OffersSuccessState)) {
                    final offers = state.offers;
                    return Column(
                      children: [
                        SizedBox(
                          height: 180,
                          child: PageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                currentPage = index;
                              });
                            },
                            itemCount: offers.length,
                            itemBuilder: (context, index) {
                              return CustomOfferIteam(
                                offersData: offers[index],
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(offers.length, (index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: currentPage == index ? 10 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? AppColors.lightColors.chipSelectedColor
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  } else if (state is OffersErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return SizedBox();
                },
              ),

              SizedBox(height: 30),
              //----------category---------
              SizedBox(
                height: 40,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is CategorySuccess) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return CustomCategoryItem(
                            categoryModel: state.categories[index],
                            index: index,
                            onTap: () {
                              context.read<CategoryCubit>().selectCategory(
                                index,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CategoryScreen();
                                  },
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
              SizedBox(height: 15),
              //----------products--------
              BlocBuilder<ProductsCubit, ProductsStates>(
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductsSuccessState) {
                    final products = state.products;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .6,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          productDataModel: products[index],
                        );
                      },
                    );
                  } else if (state is ProductsErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }

                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
