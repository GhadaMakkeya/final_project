import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUploadSection extends StatefulWidget {
  const ImageUploadSection({super.key});

  @override
  State<ImageUploadSection> createState() => _ImageUploadSectionState();
}

class _ImageUploadSectionState extends State<ImageUploadSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 251, 248, 245),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color.fromARGB(255, 121, 95, 68)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color.fromARGB(255, 121, 95, 68)),
                  ),
                  child: Icon(
                    Icons.add_photo_alternate,
                    size: 28.sp,
                    color: Color.fromARGB(255, 121, 95, 68),
                  ),
                ),
                SizedBox(height: 12.h),
                const Text(
                  'UPLOAD PRIMARY IMAGE',
                  style: AppTextStyles.uploadLabel,
                ),
                SizedBox(height: 6.h),
                const Text(
                  'High-resolution JPG or PNG.\nRecommended ratio 4:5.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.uploadHint,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 248, 245),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color.fromARGB(255, 121, 95, 68)),
                ),
                child:  Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 121, 95, 68),
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
