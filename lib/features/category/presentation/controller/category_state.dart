part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});
}

final class CategoryEmpty extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccess({required this.categories});
}

final class CategoryDeleted extends CategoryState {}
