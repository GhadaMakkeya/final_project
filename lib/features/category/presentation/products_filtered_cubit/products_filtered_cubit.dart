
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/category/data/services/products_filtered_by_category.dart';
import 'package:veloura/features/category/presentation/products_filtered_cubit/products_filtered_state.dart';

class ProductsFilterByCategoryCubit extends Cubit<ProductsFilterByCategoryState> {
  final ProductsFilteredByCategoryService productsFilteredByCategoryService = ProductsFilteredByCategoryService();

  ProductsFilterByCategoryCubit() : super(ProductsInitial());

  Future<void> filterProducts({String? categoryName}) async {
    emit(ProductsFilterLoading());
    
    try {
      final result = await productsFilteredByCategoryService.getProductsByCategory(category: categoryName);
      
      if (result.isEmpty) {
        emit(ProductsFilterError("There is no products in this category"));
      } else {
        emit(ProductsFilterSuccess(result));
      }
    } catch (e) {
      emit(ProductsFilterError("Error: ${e.toString()}"));
    }
  }
}