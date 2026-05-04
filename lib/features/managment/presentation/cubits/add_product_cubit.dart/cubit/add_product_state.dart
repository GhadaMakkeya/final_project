part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {}

class AddProductError extends AddProductState {
  final String errMessage;
  AddProductError(this.errMessage);
}
