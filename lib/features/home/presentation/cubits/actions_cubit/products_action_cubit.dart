import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductsActionStates {}

class ProductsActionInitial extends ProductsActionStates {}

class ProductsActionFavoriteChanged extends ProductsActionStates {
  final int productId;
  ProductsActionFavoriteChanged(this.productId);
}

class ProductsActionCubit extends Cubit<ProductsActionStates> {
  ProductsActionCubit() : super(ProductsActionInitial());

  final Set<int> favoriteIds = {};

  bool isProductFavorite(int productId) {
    return favoriteIds.contains(productId);
  }

  void toggleFavorite(int productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }

    emit(ProductsActionFavoriteChanged(productId));
  }
}
