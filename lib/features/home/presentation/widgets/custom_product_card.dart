import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/home/data/models/product_data_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.productDataModel});
  final ProductDataModel productDataModel;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailsScreen();
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: .9,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8.r),
                    child: Image.network(
                      productDataModel.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(productDataModel.productName, style: textTheme.titleLarge),
              Text(
                productDataModel.price,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return ProductDetailsScreen();
//               },
//             ),
//           );
//         },
//         child: Container(
//           padding: const EdgeInsets.all(5),
//           decoration: BoxDecoration(color: AppColors.backgroundColor),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(color: Colors.white),

//                 child: AspectRatio(
//                   aspectRatio: .60,
//                   child: Image.network(
//                     productDataModel.imagePath,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 12),
//               Text(productDataModel.productName, style: textTheme.titleLarge),

//               const SizedBox(height: 4),
//               Text(
//                 productDataModel.price,
//                 style: textTheme.bodyMedium?.copyWith(
//                   color: colors.textSecondary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );