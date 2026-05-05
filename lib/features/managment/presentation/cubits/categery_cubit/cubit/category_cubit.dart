import 'package:bloc/bloc.dart';
import 'package:veloura/features/managment/data/models/category_model.dart';
import 'package:veloura/features/managment/data/data_sources/add_product_remote_data_source.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ProductRemoteDataSource productRemoteDataSource;

  CategoryCubit(this.productRemoteDataSource) : super(CategoryInitial());

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await productRemoteDataSource.getAllCategories();

      if (categories.isNotEmpty) {
        emit(CategorySuccess(categories));
      } else {
        emit(CategoryError("Categories list is empty"));
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
