import 'package:veloura/features/home/data/models/product_model.dart';

abstract class ProductsFilterByCategoryState {}

class ProductsInitial extends ProductsFilterByCategoryState {}

class ProductsFilterLoading extends ProductsFilterByCategoryState {}

class ProductsFilterSuccess extends ProductsFilterByCategoryState {
  final List<ProductModel> products;
  ProductsFilterSuccess(this.products);
}

class ProductsFilterError extends ProductsFilterByCategoryState {
  final String message;
  ProductsFilterError(this.message);
}