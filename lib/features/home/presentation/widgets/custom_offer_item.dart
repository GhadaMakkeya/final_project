import 'package:flutter/material.dart';
import 'package:veloura/features/home/data/offers_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOfferIteam extends StatelessWidget {
  const CustomOfferIteam({super.key, required this.offersData});
  final OffersData offersData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 8.w, left: 6.w),
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
              padding: const EdgeInsets.all(24),
              child: Column(
                spacing: 4.sp,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    offersData.offerTitle,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  Text(
                    offersData.offerDesc,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
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
