import 'package:flutter/material.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_styles.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';
import 'package:veloura/features/cart/presentation/widgets/cart_item.dart';
import 'package:veloura/features/cart/presentation/widgets/summary_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final List<CartItemModel> cartItems = [
    CartItemModel(
      name: 'Cashmere & Silk Scarf',
      subtitle: 'Midnight Navy',
      price: 345.00,
      quantity: 1,
      image: 'assets/images/Silk Scarf.png',
    ),
    CartItemModel(
      name: 'Eternity Band',
      subtitle: '18k Yellow Gold, Size 7',
      price: 1250.00,
      quantity: 1,
      image: 'assets/images/Gold Ring.png',
    ),
    CartItemModel(
      name: 'Oud Bergamot',
      subtitle: 'Eau de Parfum, 50ml',
      price: 195.00,
      quantity: 2,
      image: 'assets/images/Perfume.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined, color: AppColors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 4.h),
                child: Text("Your Cart", style: AppTextStyles.sectionHeading),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "${cartItems.length} items ready for checkout.",
                  style: AppTextStyles.productDescription,
                ),
              ),
              SizedBox(height: 48.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItem(
                    name: item.name,
                    subtitle: item.subtitle,
                    image: item.image,
                    price: item.price,
                    quantity: item.quantity,
                    onRemove: () => setState(() => cartItems.removeAt(index)),
                    onIncrement: () => setState(() => item.quantity++),
                    onDecrement: () => setState(() {
                      if (item.quantity > 1) item.quantity--;
                    }),
                  );
                },
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 32.h),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 251, 247, 247),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Summary", style: AppTextStyles.cartSummaryTitle),

                      SizedBox(height: 16.h),
                      Divider(height: 24.h, color: AppColors.divider),
                      SizedBox(height: 16.h),
                      SummaryRow(label: "Subtotal", value: "\$1,985.00"),
                      SizedBox(height: 8.h),
                      SummaryRow(label: "Shipping", value: "Complimentary"),
                      SizedBox(height: 8.h),
                      SummaryRow(label: "Estimated Tax", value: "\$158.80"),
                      SizedBox(height: 16.h),
                      Divider(height: 24.h, color: AppColors.divider),
                      SizedBox(height: 16.h),
                      SummaryRow(
                        label: "Total",
                        value: "\$2,143.80",
                        isBold: true,
                        labelFontSize: 24.sp,
                        valueFontSize: 32.sp,
                        fontFamily: AppFontFamilies.georgia,
                      ),
                      SizedBox(height: 24.h),
                      CustomPrimaryButton(
                        onPressed: () {},
                        label: "PROCEED TO CHECKOUT",
                        letterSpacing: 0,
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            size: 14.sp,
                            color: AppColors.brown,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "SECURE CHECKOUT",
                            style: AppTextStyles.secureCheckoutLabel,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
