import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/home/data/models/product_model.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_cubit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../widgets/review_card.dart';
import '../widgets/product_features_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      product.imageUrl,
                      height: 400.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: colors.background,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 20.sp,
                                  color: colors.primary,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                _buildCircleIcon(Icons.favorite_border, colors),
                                SizedBox(width: 8.w),
                                _buildCircleIcon(Icons.ios_share, colors),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.category, style: textTheme.titleSmall),
                      SizedBox(height: 8.h),
                      Text(product.name, style: textTheme.headlineMedium),

                      SizedBox(height: 12.h),
                      Text('\$${product.price}', style: textTheme.titleMedium),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: colors.primary,
                                size: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text('(24 Reviews)', style: textTheme.bodySmall),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        product.description,
                        style: textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20.h),
                      const ProductFeaturesList(),
                      SizedBox(height: 32.h),
                      Divider(color: colors.border, thickness: 1),
                      SizedBox(height: 32.h),
                      Text('Reviews', style: textTheme.headlineSmall),
                      SizedBox(height: 20.h),
                      const ReviewCard(
                        name: 'Eleanor V.',
                        date: 'Oct 12, 2023',
                        rating: 5,
                        comment:
                            'Absolutely exquisite. The silk has a substantial weight to it that drapes beautifully, and the colors are even richer in person than in the photos.',
                      ),
                      const ReviewCard(
                        name: 'Sophia L.',
                        date: 'Sep 28, 2023',
                        rating: 4,
                        comment:
                            'A lovely piece, though slightly smaller than I anticipated. The hand-rolled edges are a testament to the craftsmanship.',
                      ),
                      SizedBox(height: 16.h),
                      CustomPrimaryButton(
                        onPressed: () {},
                        label: "Read All Reviews",
                        letterSpacing: 0.5,
                      ),
                      SizedBox(height: 100.h),
                      CustomPrimaryButton(
                        onPressed: () {
                          context.read<CartCubit>().addToCart(product.id, 1);
                        },
                        label: "ADD TO CART",
                        letterSpacing: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon, MyColors colors) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: colors.background,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20.sp, color: colors.primary),
    );
  }
}
