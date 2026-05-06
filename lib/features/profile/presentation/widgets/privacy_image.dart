import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyImage extends StatelessWidget {
  final String imagePath;

  const PrivacyImage({
    super.key,
    required this.imagePath,
    required String imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,

          alignment: Alignment.center,
        ),
      ),
    );
  }
}
