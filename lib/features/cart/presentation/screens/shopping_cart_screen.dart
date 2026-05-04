import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_theme.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_state.dart';
import 'package:veloura/features/cart/presentation/widgets/cart_item.dart';
import 'package:veloura/features/cart/presentation/widgets/summary_row.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();

          if (state is CartLoadingState) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state is CartFailureState) {
            return Scaffold(body: Center(child: Text(state.errorMessage)));
          }
          final items = state is CartSuccessState
              ? state.cartItems
              : state is CartitemUpdatingState
              ? state.cartItems
              : [];

          return Scaffold(
            backgroundColor: context.colors.background,
            appBar: CustomAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, color: context.colors.textPrimary),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: context.colors.textPrimary
                  ),
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
                      child: Text(
                        "Your Cart",
                        style: Theme.of(context).textTheme.headlineLarge
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "${items.length} items ready for checkout.",
                        style: Theme.of(context).textTheme.bodySmall
                      ),
                    ),
                    SizedBox(height: 48.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CartItem(items: item,
                          
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
                            Text(
                              "Summary",
                             style: Theme.of(context).textTheme.headlineSmall
                            ),
                            SizedBox(height: 16.h),
                            Divider(height: 24.h, color: context.colors.border),
                            SizedBox(height: 16.h),
                            SummaryRow(
                              label: "Subtotal",
                              value: "\$${cubit.subtotal.toStringAsFixed(2)}",
                            ),
                            SizedBox(height: 8.h),
                            SummaryRow(
                              label: "Shipping",
                              value: "Complimentary",
                            ),
                            SizedBox(height: 8.h),
                            SummaryRow(
                              label: "Estimated Tax",
                              value: "\$${cubit.tax.toStringAsFixed(2)}",
                            ),
                            SizedBox(height: 16.h),
                            Divider(height: 24.h, color: context.colors.border),
                            SizedBox(height: 16.h),
                            SummaryRow(
                              label: "Total",
                              value: "\$${cubit.total.toStringAsFixed(2)}",
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
                                  color: context.colors.gold
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "SECURE CHECKOUT",
                                  style: Theme.of(context).textTheme.labelMedium
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
        },
      ),
    );
  }
}
