import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

class ImageUploadSection extends StatefulWidget {
  const ImageUploadSection({super.key});

  @override
  State<ImageUploadSection> createState() => _ImageUploadSectionState();
}

class _ImageUploadSectionState extends State<ImageUploadSection> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Primary image upload box ──────────────────────────────────────
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              color: colors.cardColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colors.border),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colors.background,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: colors.border),
                  ),
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 28.sp,
                    color: colors.textSecondary,
                  ),
                ),
                SizedBox(height: 12.h),
                Text('UPLOAD PRIMARY IMAGE', style: textTheme.titleSmall),
                SizedBox(height: 6.h),
                Text(
                  'High-resolution JPG or PNG.\nRecommended ratio 4:5.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 12.h),

        // ── 3 thumbnail boxes (+ button + 2 empty slots) ──────────────────
        Row(
          children: [
            // "+" add button
            _ThumbnailBox(
              colors: colors,
              child: Icon(Icons.add, color: colors.textSecondary, size: 20.sp),
              onTap: () {},
            ),
            SizedBox(width: 10.w),
            // empty slot 1
            _ThumbnailBox(colors: colors),
            SizedBox(width: 10.w),
            // empty slot 2
            _ThumbnailBox(colors: colors),
          ],
        ),
      ],
    );
  }
}

class _ThumbnailBox extends StatelessWidget {
  final MyColors colors;
  final Widget? child;
  final VoidCallback? onTap;

  const _ThumbnailBox({required this.colors, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: colors.border),
        ),
        child: child != null ? Center(child: child) : null,
      ),
    );
  }
}
