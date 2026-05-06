import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductsActionStates {}

class ProductsActionInitial extends ProductsActionStates {}

class ProductsActionFavoriteChanged extends ProductsActionStates {}

// دي الـ State اللي كانت ناقصة وعاملة خط أحمر في الـ Cubit
class ProductsActionCubit extends Cubit<ProductsActionStates> {
  ProductsActionCubit() : super(ProductsActionInitial());

  // بنستخدم Set عشان نشيل أرقام الـ ID المميزة للمنتجات المفضلة
  Set<int> favoriteIds = {};

  // فانكشن بتشوف المنتج ده موجود في المفضلة ولا لا بناءً على الـ ID
  bool isProductFavorite(int productId) {
    return favoriteIds.contains(productId);
  }

  void toggleFavorite(int productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId); // لو موجود بنشيله
    } else {
      favoriteIds.add(productId); // لو مش موجود بنضيفه
    }

    // لازم نبعت State جديدة عشان الـ UI يحس بالتغيير
    emit(ProductsActionFavoriteChanged());
  }
}
