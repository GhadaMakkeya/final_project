import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/home/data/models/product_model.dart';
import 'package:veloura/features/home/presentation/cubits/product_action_cubit/product_action_cubit.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';

class CustomProductItem extends StatefulWidget {
  final ProductModel product;
  const CustomProductItem({super.key, required this.product});

  @override
  State<CustomProductItem> createState() => _CustomProductItemState();
}

class _CustomProductItemState extends State<CustomProductItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: widget.product),
          ),
        );
      },
      child: Card(
        elevation: 0.5,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1.1,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: Image.network(
                        widget.product.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child:
                        BlocBuilder<ProductsActionCubit, ProductsActionStates>(
                          builder: (context, state) {
                            final isFav = context
                                .read<ProductsActionCubit>()
                                .isProductFavorite(widget.product.id);

                            return IconButton(
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : Colors.white,
                              ),
                              onPressed: () {
                                context
                                    .read<ProductsActionCubit>()
                                    .toggleFavorite(widget.product.id);
                              },
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14.sp),
                          Text(" 4.8", style: textTheme.labelSmall),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "${widget.product.price} EGP",
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Divider(height: 1.h, thickness: 0.5, color: colors.border),
                  SizedBox(height: 8.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "MIDNIGHT BLUE",
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.grey,
                          fontSize: 8.sp,
                        ),
                      ),
                      Text(
                        "LIMITED STOCK",
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.red,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}