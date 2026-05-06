import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductsActionStates {}

class ProductsActionInitial extends ProductsActionStates {}

class ProductsActionCubit extends Cubit<ProductsActionStates> {
  ProductsActionCubit() : super(ProductsActionInitial());

  List<int> favoriteIds = [];

  void toggleFavorite(int productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }
    emit(ProductsActionInitial());
  }

  bool isFavorite(int productId) => favoriteIds.contains(productId);
}
