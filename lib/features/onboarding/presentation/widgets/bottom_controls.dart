import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';

class BottomControls extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;

  const BottomControls({
    required this.currentPage,
    required this.pageCount,
    required this.onNext,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLast = currentPage == pageCount - 1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pageCount,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                height: 8,
                width: currentPage == index ? 20 : 8,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? Color(0xFF1B2A4A)
                      : Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          CustomPrimaryButton(
            label: isLast ? 'GET STARTED' : 'NEXT',
            onPressed: isLast ? onGetStarted : onNext,
            height: 54,
            width: 350,
          ),
        ],
      ),
    );
  }
}
