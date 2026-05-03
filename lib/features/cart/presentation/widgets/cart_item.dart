import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_cubit.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.items});
  final CartItemModel items;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.items.quantity;
  }

  void onIncrement() {
    setState(() => quantity++);
    context.read<CartCubit>().incrementItem(widget.items);
  }

  void onDecrement() {
    if (quantity == 1) {
      context.read<CartCubit>().removeItem(widget.items.itemId);
      return;
    }
    setState(() => quantity--);
    context.read<CartCubit>().decrementItem(widget.items);
  }

  void onRemove() {
    context.read<CartCubit>().removeItem(widget.items.itemId);
  }

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
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.network(
                widget.items.productCoverUrl,
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200.h,
                  color: Colors.grey[200],
                  child: Icon(Icons.image_not_supported),
                ),
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
                    Expanded(
                      child: Text(
                        widget.items.productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          fontFamily: AppFontFamilies.georgia,
                          color: Color(0xFF4E4639),
                        ),
                      ),
                    ),
                    Text(
                      '\$${widget.items.finalPricePerUnit.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        fontFamily: AppFontFamilies.georgia,
                        color: Color(0xFF4E4639),
                      ),
                    ),
                  ],
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
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
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
      child: Container(
        width: 28.w,
        height: 28.h,
        child: Icon(icon, size: 16.sp),
      ),
    );
  }
}