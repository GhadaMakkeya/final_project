import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';

class BottomActionButtons extends StatelessWidget {
  final VoidCallback onPublish;

  const BottomActionButtons({
    super.key,
    required this.onPublish,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPrimaryButton(
            onPressed: onPublish,
            label: "Publish Product",
            letterSpacing: 1,
          ),
        ],
      ),
    );
  }
}
