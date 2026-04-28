import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final String name, subtitle, image;
  final double price;
  final int quantity;
  final VoidCallback onRemove, onIncrement, onDecrement;
  const CartItem({
    super.key,
    required this.name,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.quantity,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF2EDE8),
      elevation: 0.1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 8.w, right: 8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(bottom: 24.h, left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        fontFamily: AppFontFamilies.georgia,
                        color: Color(0xFF4E4639),
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        fontFamily: AppFontFamilies.georgia,
                        color: Color(0xFF4E4639),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13.sp, color: Color.fromARGB(255, 160, 149, 133),),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 225, 221, 216),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          _qtyButton(Icons.remove, onDecrement),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              '$quantity',
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ),
                          _qtyButton(Icons.add, onIncrement),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onRemove,
                      child: Text(
                        "REMOVE",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 28.w, height: 28.h, child: Icon(icon, size: 16.sp)),
    );
  }
}
