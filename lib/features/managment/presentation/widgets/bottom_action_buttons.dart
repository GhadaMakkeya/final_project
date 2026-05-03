import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';

class BottomActionButtons extends StatelessWidget {
  final VoidCallback onPublish;
  final VoidCallback onSaveDraft;

  const BottomActionButtons({
    super.key,
    required this.onPublish,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPrimaryButton(
            onPressed: () {},
            label: "Publish Product",
            letterSpacing: 1,
          ),
          SizedBox(height: 30.h),
          CustomPrimaryButton(
            onPressed: () {},
            label: "Save Draft",
            letterSpacing: 1,
          ),
        ],
      ),
    );
  }
}
