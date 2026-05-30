import 'package:veloura/features/cart/data/models/cart_item_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<CartItemModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartFailureState extends CartState {
  final String errorMessage;

  CartFailureState({required this.errorMessage});
}

class CartitemUpdatingState extends CartState {
  final List<CartItemModel> cartItems;
  CartitemUpdatingState({required this.cartItems});
}
