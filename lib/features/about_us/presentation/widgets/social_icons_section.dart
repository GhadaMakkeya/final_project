import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialIconsSection extends StatelessWidget {
  const SocialIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.camera_alt_outlined,
            color: Colors.grey.shade700),

        SizedBox(width: 30.w),

        Icon(Icons.push_pin_outlined,
            color: Colors.grey.shade700),

        SizedBox(width: 30.w),

        Icon(Icons.language,
            color: Colors.grey.shade700),
      ],
    );
  }
}