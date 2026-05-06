import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/constants/app_font_families.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_app_bar.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_state.dart';
import 'package:veloura/features/cart/presentation/widgets/cart_item.dart';
import 'package:veloura/features/cart/presentation/widgets/summary_row.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch cart when the screen first loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartCubit>().getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();

        if (state is CartLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is CartFailureState) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 60.sp,
                    color: colors.textTertiary,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Failed to load cart',
                    style: textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    state.errorMessage,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () => context.read<CartCubit>().getCart(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        final List<CartItemModel> items =
            state is CartSuccessState
                ? state.cartItems
                : state is CartitemUpdatingState
                    ? state.cartItems
                    : [];

        return Scaffold(
          backgroundColor: colors.background,
          appBar: CustomAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: colors.textPrimary),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
          body: items.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 70.sp,
                        color: colors.textTertiary,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Your cart is empty',
                        style: textTheme.headlineSmall,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Add some luxury items to get started.',
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 4.h),
                          child: Text(
                            'Your Cart',
                            style: textTheme.headlineLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            '${items.length} item${items.length == 1 ? '' : 's'} ready for checkout.',
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                        ),
                        SizedBox(height: 48.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return CartItem(items: item);
                          },
                        ),
                        SizedBox(height: 40.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 50.h),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(
                              20.w,
                              24.h,
                              20.w,
                              32.h,
                            ),
                            decoration: BoxDecoration(
                              color: colors.cardColor,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: colors.border,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Summary',
                                  style: textTheme.headlineSmall,
                                ),
                                SizedBox(height: 16.h),
                                Divider(height: 24.h, color: colors.border),
                                SizedBox(height: 16.h),
                                SummaryRow(
                                  label: 'Subtotal',
                                  value:
                                      '\$${cubit.subtotal.toStringAsFixed(2)}',
                                ),
                                SizedBox(height: 8.h),
                                SummaryRow(
                                  label: 'Shipping',
                                  value: 'Complimentary',
                                ),
                                SizedBox(height: 8.h),
                                SummaryRow(
                                  label: 'Estimated Tax (8%)',
                                  value: '\$${cubit.tax.toStringAsFixed(2)}',
                                ),
                                SizedBox(height: 16.h),
                                Divider(height: 24.h, color: colors.border),
                                SizedBox(height: 16.h),
                                SummaryRow(
                                  label: 'Total',
                                  value: '\$${cubit.total.toStringAsFixed(2)}',
                                  isBold: true,
                                  labelFontSize: 24.sp,
                                  valueFontSize: 32.sp,
                                  fontFamily: AppFontFamilies.georgia,
                                ),
                                SizedBox(height: 24.h),
                                CustomPrimaryButton(
                                  onPressed: () {},
                                  label: 'PROCEED TO CHECKOUT',
                                  letterSpacing: 0,
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.lock_outline,
                                      size: 14.sp,
                                      color: colors.gold,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'SECURE CHECKOUT',
                                      style: textTheme.labelMedium,
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
    );
  }
}
