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

  Future<void> _showDeleteDialog(BuildContext context, ProductModel product, int index) async {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: colors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: colors.border, width: 0.5),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning_amber_rounded, color: BaseColors.alert, size: 40.sp),
                SizedBox(height: 16.h),
                Text('Confirm Deletion?', style: textTheme.headlineSmall),
                SizedBox(height: 8.h),
                Text(
                  '"${product.name}" will be permanently removed from the catalog.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.of(dialogContext).pop(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BaseColors.alert,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        ),
                        child: Text('DELETE', style: textTheme.labelLarge?.copyWith(color: Colors.white)),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        ),
                        child: Text('CANCEL', style: textTheme.labelLarge),
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

    if (confirm != true) return;
    if (!mounted) return;

    final cubit = context.read<ManagementCubit>();
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
              Icon(Icons.check_circle_outline, color: colors.gold),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Product Deleted Successfully', 
                    style: textTheme.titleMedium?.copyWith(fontSize: 13.sp)),
                  Text('DATABASE HAS BEEN UPDATED', 
                    style: textTheme.labelSmall?.copyWith(color: colors.textSecondary)),
                ],
              ),
            ],
          ),
          backgroundColor: colors.cardColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r), side: BorderSide(color: colors.border)),
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
        leading: Icon(Icons.menu, color: colors.primary),
        title: Text('Product Management', style: textTheme.headlineSmall?.copyWith(fontStyle: FontStyle.italic)),
        actions: [Icon(Icons.search, color: colors.primary), SizedBox(width: 16.w)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text('CURATED COLLECTION', style: textTheme.titleSmall),
            SizedBox(height: 4.h),
            Text('Manage Products', style: textTheme.headlineMedium),
            SizedBox(height: 8.h),
            Container(width: 40.w, height: 2.h, color: colors.gold),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<ManagementCubit, ManagementState>(
                builder: (context, state) {
                  if (state is ManagementLoading) {
                    return Center(child: CircularProgressIndicator(color: colors.gold));
                  } 
                  else if (state is ManagementError) {
                    return Center(child: Text(state.message, style: TextStyle(color: BaseColors.alert)));
                  } 
                  else if (state is ManagementSuccess) {
                    final products = state.products;
                    if (products.isEmpty) {
                      return Center(child: Text('No products available right now.', style: textTheme.bodyLarge));
                    }

                    return AnimatedList(
                      key: _listKey,
                      initialItemCount: products.length,
                      padding: EdgeInsets.only(bottom: 20.h),
                      itemBuilder: (context, index, animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: ProductManagementCard(
                            product: products[index],
                            onDelete: () => _showDeleteDialog(context, products[index], index),
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: Text('Initializing...', style: textTheme.bodySmall));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}