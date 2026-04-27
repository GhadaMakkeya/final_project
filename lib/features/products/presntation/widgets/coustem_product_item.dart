import 'package:flutter/material.dart';

import 'package:veloura/features/products/presntation/widgets/product_model.dart';

class CustomProductItem extends StatelessWidget {
  final Product productModel;
  const CustomProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffFCFAF7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1.3,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage(productModel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (productModel.label != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      color: _getLabelColor(productModel.label!),

                      child: Text(
                        productModel.label!,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(),

                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Expanded(
                  child: Text(
                    productModel.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Text(
                "4.8",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Text(
                productModel.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                productModel.originalPrice ?? "",
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 0.5, color: Color(0xffEEEEEE)),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("MIDNIGHT", style: _subTextStyle()),
                  Text("BLUE", style: _subTextStyle()),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LIMITED",
                    style: _subTextStyle(color: const Color(0xffD9534F)),
                  ),
                  Text(
                    "STOCK",
                    style: _subTextStyle(color: const Color(0xffD9534F)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle _subTextStyle({Color color = Colors.grey}) {
    return TextStyle(
      color: color,
      fontSize: 8,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      height: 1.3,
    );
  }

  Color _getLabelColor(String label) {
    if (label == "NEW") {
      return const Color(0xffD9534F);
    } else if (label == "SOLD OUT") {
      return Colors.grey;
    } else {
      return Colors.black;
    }
  }
}
