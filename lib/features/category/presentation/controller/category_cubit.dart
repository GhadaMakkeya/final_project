import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/category_model.dart';
import '../../data/services/category_service.dart';

part 'category_state.dart';
class CategoryCubit extends Cubit<CategoryState> {
  final CategoryService categoryService;

  CategoryCubit(this.categoryService) : super(CategoryInitial());

  List<CategoryModel> categoriesList = [];
  int selectedIndex = 0;
  String? selectedCategoryId;

  Future<void> getAllCategories() async {
    if (categoriesList.isNotEmpty) {
      emit(CategorySuccess(categories: categoriesList));
      return;
    }
    emit(CategoryLoading());
    try {
      final categories = await categoryService.getCategories();
      categoriesList = categories;
      if (categories.isNotEmpty) {
        emit(CategorySuccess(categories: categoriesList));
      } else {
        emit(CategoryEmpty());
      }
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  void selectCategoryByIndex(int index) {
    selectedIndex = index;
    selectedCategoryId = categoriesList[index].id; 
    emit(CategorySuccess(categories: categoriesList));
  }

  void selectCategoryById(String? id) {
    selectedCategoryId = id;
    selectedIndex = categoriesList.indexWhere((cat) => cat.id == id);
    emit(CategorySuccess(categories: categoriesList));
  }
}