
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/product_details/data/add_review_remote_data_source.dart';
import 'package:veloura/features/product_details/presentation/cubits/reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsStates> {
  final AddReviewRemoteDataSource dataSource = AddReviewRemoteDataSource();

  ReviewsCubit() : super(ReviewsInitial());

  Future<void> getReviews(String productId) async {
    emit(ReviewsLoading());

    try {
      final reviews = await dataSource.getReviews(productId);

      emit(ReviewsSuccess(reviews));
    } catch (e) {
      emit(ReviewsFailure(e.toString()));
    }
  }
}
