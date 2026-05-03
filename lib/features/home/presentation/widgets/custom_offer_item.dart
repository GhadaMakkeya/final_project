import 'package:flutter/material.dart';
import 'package:veloura/features/home/data/offers_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOfferIteam extends StatelessWidget {
  const CustomOfferIteam({super.key, required this.offersData});
  final OffersData offersData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(right: 8.w, left: 6.w),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15.r),
              child: Image.network(
                offersData.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                spacing: 4.sp,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    offersData.offerTitle, // "Winter Collection"
                    style: textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                  Text(
                    offersData.offerDesc,
                    // "Exclusive 20% off..."
                    style: textTheme.bodySmall?.copyWith(color: Colors.white70),
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
