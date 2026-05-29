import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductsActionStates {}

class ProductsActionInitial extends ProductsActionStates {}

class ProductsActionFavoriteChanged extends ProductsActionStates {
  final String productId;
  ProductsActionFavoriteChanged(this.productId);
}

class ProductsActionCubit extends Cubit<ProductsActionStates> {
  ProductsActionCubit() : super(ProductsActionInitial());

  final Set<String> favoriteIds = {};

  bool isProductFavorite(String productId) {
    return favoriteIds.contains(productId);
  }

  void toggleFavorite(String productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }

    emit(ProductsActionFavoriteChanged(productId));
  }
}