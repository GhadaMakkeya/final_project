sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductError extends AddProductState {
  final String errMessage;
  AddProductError(this.errMessage);
}

final class PickImageLoading extends AddProductState {}
