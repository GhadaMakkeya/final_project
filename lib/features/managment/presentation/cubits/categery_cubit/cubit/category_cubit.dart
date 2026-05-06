import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../../../category/data/models/category_model.dart';
import '../../../../data/data_sources/add_product_remote_data_source.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ProductRemoteDataSource productRemoteDataSource;

  CategoryCubit(this.productRemoteDataSource) : super(CategoryInitial());
  int selectedIndex = 0;
  List<CategoryModel> categories = [];
  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await productRemoteDataSource.getAllCategories();
      log("Categories loaded: ${categories.length}");
      this.categories = categories;
      if (categories.isNotEmpty) {
        emit(CategorySuccess(categories));
      } else {
        emit(CategoryError("Categories list is empty"));
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void selectCategory(int index) {
    selectedIndex = index;
    emit(CategorySuccess(categories));
  }
}
