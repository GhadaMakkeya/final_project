import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConciergeSection extends StatelessWidget {
  const ConciergeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EDE6),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            'Dedicated Privacy\nConcierge',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Georgia',
              color: const Color(0xFF1A1A2E),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.h),
          Text(
            'Should you require a detailed analysis of our protocols, our specialized team is at your disposal.',
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF7A7570),
              height: 1.75,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E2A4A),
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            child: const Text(
              'CONTACT CONCIERGE',
              style: TextStyle(color: Colors.white, letterSpacing: 2.5),
            ),
          ),
        ],
      ),
    );
  }
}
