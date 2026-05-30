// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartRemoteDataSource cartRemoteDataSource =CartRemoteDataSource();
  CartCubit() : super(CartInitialState());

  List<CartItemModel> cartItems = [];

  Future<void> addToCart(String productId, int quantity) async {
    await cartRemoteDataSource.addToCart(productId, quantity);
    await getCart();
  }

  Future<void> getCart() async {
    emit(CartLoadingState());
    await cartRemoteDataSource.getCart().then(
      (value) {
        log('Items: $value', name: 'cart cubit');
        cartItems = value;
        emit(CartSuccessState(cartItems: cartItems));
      },
      onError: (error) {
        emit(CartFailureState(errorMessage: error.toString()));
      },
    );
  }

  Future<void> incrementItem(CartItemModel item) async {
    item.quantity++;
    emit(CartitemUpdatingState(cartItems: cartItems));
    await cartRemoteDataSource.updatedItem(item.itemId, item.quantity);
  }

  Future<void> decrementItem(CartItemModel item) async {
    item.quantity--;
    emit(CartitemUpdatingState(cartItems: cartItems));
    await cartRemoteDataSource.decrementItem(item.itemId);
  }

  Future<void> removeItem(String itemId) async {
    cartItems.removeWhere((e) => e.itemId == itemId);
    emit(CartitemUpdatingState(cartItems: cartItems));
    await cartRemoteDataSource.removeItem(itemId);
  }

  double get subtotal => cartItems.fold(
    0,
    (sum, item) => sum + (item.finalPricePerUnit * item.quantity),
  );

  double get tax => subtotal * 0.08;

  double get total => subtotal + tax;
}
