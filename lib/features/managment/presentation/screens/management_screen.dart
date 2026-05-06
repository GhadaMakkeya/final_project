import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';
import 'package:veloura/features/managment/presentation/cubits/management_cubit/management_cubit.dart';
import '../widgets/product_management_card.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ManagementCubit>().fetchAllProducts();
    });
  }

  Future<void> _showDeleteDialog(
    BuildContext context,
    Product product,
    int index,
  ) async {
    // Capture ALL context-dependent values before ANY async gap (incl. showDialog)
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<ManagementCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final goldColor = colors.gold;
    final cardColor = colors.cardColor;
    final secondaryColor = colors.textSecondary;
    final labelMediumStyle = textTheme.labelMedium;
    final labelSmallStyle = textTheme.labelSmall;
    final listKey = _listKey;

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: colors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: colors.gold,
                  size: 40.sp,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Confirm Deletion',
                  style: textTheme.headlineSmall,
                ),
                SizedBox(height: 8.h),
                Text(
                  '"${product.name}" will be permanently removed from the catalog.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.of(dialogContext).pop(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade700,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: const Text('DELETE'),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () =>
                            Navigator.of(dialogContext).pop(false),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colors.textPrimary,
                          side: BorderSide(color: colors.border),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: const Text('CANCEL'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (confirm != true || !mounted) return;

    final success = await cubit.deleteProduct(product.id);

    if (!mounted) return;

    if (success) {
      listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: FadeTransition(
            opacity: animation,
            child: ProductManagementCard(product: product, onDelete: () {}),
          ),
        ),
      );

      messenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle_outline, color: goldColor),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Product Deleted',
                    style: labelMediumStyle?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'CATALOG HAS BEEN UPDATED',
                    style: labelSmallStyle?.copyWith(
                      color: secondaryColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: cardColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: Icon(Icons.menu, color: colors.textPrimary),
        title: Text(
          'Product Management',
          style: textTheme.titleLarge?.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          Icon(Icons.search, color: colors.textPrimary),
          SizedBox(width: 16.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              'CURATED COLLECTION',
              style: textTheme.labelMedium?.copyWith(
                color: colors.textSecondary,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Manage Products',
              style: textTheme.headlineSmall,
            ),
            SizedBox(height: 8.h),
            Container(
              width: 40.w,
              height: 2.h,
              color: colors.gold,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<ManagementCubit, ManagementState>(
                builder: (context, state) {
                  if (state is ManagementLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: colors.primary),
                    );
                  } else if (state is ManagementError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else if (state is ManagementSuccess) {
                    final products = state.products;

                    if (products.isEmpty) {
                      return Center(
                        child: Text(
                          'No products available right now.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      );
                    }

                    return AnimatedList(
                      key: _listKey,
                      initialItemCount: products.length,
                      itemBuilder: (context, index, animation) {
                        final product = products[index];
                        return SizeTransition(
                          sizeFactor: animation,
                          child: ProductManagementCard(
                            product: product,
                            onDelete: () =>
                                _showDeleteDialog(context, product, index),
                          ),
                        );
                      },
                    );
                  }

                  return Center(
                    child: Text(
                      'Initializing...',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}