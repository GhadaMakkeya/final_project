import 'package:veloura/core/models/product_model.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {
  final List<ProductModel> products;

  ProductsSuccessState({required this.products});
}

class ProductsErrorState extends ProductsStates {
  final String errorMessage;
  ProductsErrorState({required this.errorMessage});
}
