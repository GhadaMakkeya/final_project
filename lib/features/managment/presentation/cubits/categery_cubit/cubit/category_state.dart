part of 'category_cubit.dart';

sealed class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  CategorySuccess(this.categories);
}

class CategoryError extends CategoryState {
  final String errMessage;
  CategoryError(this.errMessage);
}