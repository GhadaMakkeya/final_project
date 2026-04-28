import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Text(
          title,
          style: AppTextStyles.settingsSectionLabel
        ),
      ),
    );
  }
}