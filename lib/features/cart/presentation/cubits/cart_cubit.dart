import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/cart/data/models/cart_item_model.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_state.dart';

import '../../data/data_source/cart_remote_data_source.dart';

class CartCubit extends Cubit<CartState> {
  final CartRemoteDataSource cartRemoteDataSource;

  CartCubit(this.cartRemoteDataSource) : super(CartInitialState());

  List<CartItemModel> cartItems = [];

  Future<void> getCart() async {
    emit(CartLoadingState());
    try {
      cartItems = await cartRemoteDataSource.getCart();
      log('Items count: ${cartItems.length}', name: 'CartCubit');
      emit(CartSuccessState(cartItems: cartItems));
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> incrementItem(CartItemModel item) async {
    item.quantity++;
    emit(CartitemUpdatingState(cartItems: List.from(cartItems)));
    await cartRemoteDataSource.updatedItem(item.itemId, item.quantity);
  }

  Future<void> decrementItem(CartItemModel item) async {
    if (item.quantity <= 1) return;
    item.quantity--;
    emit(CartitemUpdatingState(cartItems: List.from(cartItems)));
    await cartRemoteDataSource.decrementItem(item.itemId);
  }

  Future<void> removeItem(String itemId) async {
    cartItems.removeWhere((e) => e.itemId == itemId);
    emit(CartitemUpdatingState(cartItems: List.from(cartItems)));
    await cartRemoteDataSource.removeItem(itemId);
  }

  double get subtotal => cartItems.fold(
        0,
        (sum, item) => sum + (item.finalPricePerUnit * item.quantity),
      );

  double get tax => subtotal * 0.08;

  double get total => subtotal + tax;
}