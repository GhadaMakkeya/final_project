
abstract class ReviewsStates {}

class ReviewsInitial extends ReviewsStates {}

class ReviewsLoading extends ReviewsStates {}

class ReviewsSuccess extends ReviewsStates {
  final List<dynamic> reviews;

  ReviewsSuccess(this.reviews);
}

class ReviewsFailure extends ReviewsStates {
  final String message;

  ReviewsFailure(this.message);
}
