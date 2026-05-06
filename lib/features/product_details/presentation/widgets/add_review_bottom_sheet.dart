import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/widgets/custom_primary_button.dart';
import 'package:veloura/features/product_details/data/add_review_remote_data_source.dart';
import 'package:veloura/features/product_details/presentation/cubits/reviews_cubit.dart';

class AddReviewBottomSheet extends StatefulWidget {
  final String productId;
  final BuildContext parentContext;
   final AddReviewRemoteDataSource addReviewRemoteDataSource;
  const AddReviewBottomSheet({
    super.key,
    required this.productId,
    required this.parentContext,
     required this.addReviewRemoteDataSource,
    
  });

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  int selectedRating = 0;
  final TextEditingController commentController = TextEditingController();
 
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 24.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: colors.border,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Write a Review', style: TextTheme.headlineSmall),
          SizedBox(height: 20.h),
          Text('Your Rating', style: TextTheme.titleLarge),
          SizedBox(height: 8.h),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () => setState(() => selectedRating = index + 1),
                child: Icon(
                  index < selectedRating ? Icons.star : Icons.star_border,
                  color: index < selectedRating
                      ? colors.gold
                      : colors.textTertiary,
                  size: 30.sp,
                ),
              );
            }),
          ),
          SizedBox(height: 20.h),
          Text('Your Review', style: TextTheme.titleLarge),
          SizedBox(height: 8.h),
          TextField(
            controller: commentController,
            maxLines: 4,
            style: TextTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: 'Share your experience...',
              hintStyle: TextTheme.bodyLarge?.copyWith(
                color: colors.textTertiary,
              ),
              filled: true,
              fillColor: colors.cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: colors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: colors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: colors.primary, width: 1.5),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          CustomPrimaryButton(
            onPressed: () async {
              if (selectedRating == 0 || commentController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please add rating and review')),
                );
                return;
              }
              try {
                await widget.addReviewRemoteDataSource.addReview(
                  productId: widget.productId,
                  comment: commentController.text,
                  rating: selectedRating,
                );
                widget.parentContext.read<ReviewsCubit>().getReviews(widget.productId);

                Navigator.pop(context);
                ScaffoldMessenger.of(
                  widget.parentContext,
                ).showSnackBar(const SnackBar(content: Text("Review Added ")));
              } catch (e) {
                print("FULL ERROR: $e");
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
              ;
            },
            label: 'SUBMIT REVIEW',
            letterSpacing: 0.5,
          ),
        ],
      ),
    );
  }
}
