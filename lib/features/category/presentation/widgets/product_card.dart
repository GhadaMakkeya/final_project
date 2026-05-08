import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';

import '../../../../core/utils/responsive.dart';
import '../../data/models/category_model.dart';

class ProductCard extends StatelessWidget {
  final CategoryModel category;

  final VoidCallback? onTap;

  const ProductCard({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    double w = Responsive.width(context);

    double h = Responsive.height(context);

    final textTheme = Theme.of(context).textTheme;

    final colors = context.colors;

    final imageUrl = category.coverPictureUrl;

    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(12),

      child: SizedBox(
        width: w * 0.45,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.25,

                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                    color: colors.cardColor,
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,

                            fit: BoxFit.cover,

                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,

                                  size: 40,

                                  color: colors.textSecondary,
                                ),
                              );
                            },

                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        : Center(
                            child: Icon(
                              Icons.image_outlined,

                              size: 40,

                              color: colors.textSecondary,
                            ),
                          ),
                  ),
                ),

                /// FAVORITE
                Positioned(
                  top: h * 0.01,

                  right: w * 0.02,

                  child: IconButton(
                    onPressed: () {},

                    icon: Icon(
                      Icons.favorite_border,

                      color: colors.gold,

                      size: w * 0.06,
                    ),
                  ),
                ),

                /// NEW TAG
                if (category.isNew)
                  Positioned(
                    bottom: h * 0.01,

                    left: w * 0.02,

                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.02,

                        vertical: h * 0.005,
                      ),

                      color: Colors.black,

                      child: Text(
                        "NEW",

                        style: textTheme.labelSmall?.copyWith(
                          color: BaseColors.white,

                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(height: h * 0.01),

            /// NAME + PRICE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Text(
                    category.name,

                    overflow: TextOverflow.ellipsis,

                    style: textTheme.titleLarge?.copyWith(fontSize: w * 0.05),
                  ),
                ),

                SizedBox(width: w * 0.02),

                Text(
                  "\$${category.price.toStringAsFixed(0)}",

                  style: textTheme.titleMedium?.copyWith(
                    fontSize: w * 0.04,

                    color: colors.textPrimary,
                  ),
                ),
              ],
            ),

            SizedBox(height: h * 0.005),

            /// DESCRIPTION
            Text(
              category.description,

              maxLines: 1,

              overflow: TextOverflow.ellipsis,

              style: textTheme.bodyMedium?.copyWith(fontSize: w * 0.035),
            ),
          ],
        ),
      ),
    );
  }
}
