import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Card(
      color: Color(0xffF2EDE8),
      elevation: 0.1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
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
                    Text(name, style: textTheme.titleLarge),
                    SizedBox(width: 8.w),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(subtitle, style: textTheme.bodyMedium),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.border),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          _qtyButton(Icons.remove, onDecrement, colors),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              '$quantity',
                              style: textTheme.titleMedium,
                            ),
                          ),
                          _qtyButton(Icons.add, onIncrement, colors),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onRemove,
                      child: Text("REMOVE", style: textTheme.labelMedium),
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

  Widget _qtyButton(IconData icon, VoidCallback onTap, MyColors colors) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        child: Icon(icon, size: 16.sp, color: colors.textSecondary),
      ),
    );
  }
}
