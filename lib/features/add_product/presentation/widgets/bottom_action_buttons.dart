import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPrimaryButton(onPressed: () {}, label: "Publish Product"),
          const SizedBox(height: 10),
          CustomPrimaryButton(
            onPressed: () {},
            label: "Save Draft",
            color: Color.fromARGB(255, 251, 248, 245),
            buttonTextColor: Color(0xFF1B2A4A),
            borderColor: const Color(0xFF1B2A4A),
          ),
        ],
      ),
    );
  }
}