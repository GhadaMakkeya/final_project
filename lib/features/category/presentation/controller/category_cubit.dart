import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../managment/data/models/category_model.dart';
import '../../data/services/category_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryService categoryService;

  CategoryCubit(this.categoryService) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    try {
      final categories = await categoryService.getCategories();

      if (categories.isEmpty) {
        emit(CategoryEmpty());
      } else {
        emit(CategorySuccess(categories: categories));
      }
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
