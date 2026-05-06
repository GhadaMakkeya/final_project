import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CardVariant { light, dark }

class PrivacyCard extends StatelessWidget {
  const PrivacyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    this.variant = CardVariant.light,
  });

  final IconData icon;
  final String title;
  final String body;
  final CardVariant variant;

  bool get _isDark => variant == CardVariant.dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: _isDark ? const Color(0xFF1E2A4A) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_isDark ? 0.15 : 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _IconBadge(icon: icon, isDark: _isDark),
          SizedBox(height: 18.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: _isDark ? Colors.white : const Color(0xFF1A1A2E),
              height: 1.3,
              fontFamily: 'Georgia',
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            body,
            style: TextStyle(
              fontSize: 13.sp,
              color: _isDark
                  ? const Color(0xFFB0BBCE)
                  : const Color(0xFF7A7570),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon, required this.isDark});
  final IconData icon;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.08)
            : const Color(0xFFF2EDE6),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(
        icon,
        size: 20.sp,
        color: isDark ? const Color(0xFFC4A35A) : const Color(0xFF1E2A4A),
      ),
    );
  }
}
