import 'package:veloura/features/home/data/models/product_data_model.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {
  final List<ProductDataModel> products;

  ProductsSuccessState({required this.products});
}

class ProductsErrorState extends ProductsStates {
  final String errorMessage;
  ProductsErrorState({required this.errorMessage});
}
