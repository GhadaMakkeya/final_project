import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookiesSection extends StatelessWidget {
  const CookiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.cookie_outlined, color: Color(0xFF5C6BC0)),
              SizedBox(width: 10),
              Text(
                'Cookies Policy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'We use cookies and similar technologies to track activity on our platform...',
            style: TextStyle(fontSize: 13.sp, height: 1.6),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF2EDE6),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'COOKIE PREFERENCES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 8.h),
                const Text(
                  'You can instruct your browser to refuse all cookies...',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Manage Settings',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
