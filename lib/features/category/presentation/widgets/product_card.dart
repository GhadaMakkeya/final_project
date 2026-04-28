import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/category/data/models/category_model.dart';

class ProductCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;


  ProductCard({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(category.image, fit: BoxFit.cover),

              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: AppColors.secondaryColor),
                ),
              ),

              if (category.isNew)
                Positioned(bottom: 10, left: 10, child: Text("NEW ARRIVAL")),
            ],
          ),

          SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(category.name), Text("\$${category.price}")],
          ),

          Text(category.subtitle, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}