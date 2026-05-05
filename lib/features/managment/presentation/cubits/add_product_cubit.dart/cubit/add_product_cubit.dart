import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/managment/data/data_sources/add_product_remote_data_source.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';
import 'package:veloura/features/managment/presentation/cubits/add_product_cubit.dart/cubit/add_product_state.dart';

class ProductCubit extends Cubit<AddProductState> {
  final ProductRemoteDataSource remoteDataSource;

  ProductCubit(this.remoteDataSource) : super(AddProductInitial());

  Future<void> addProduct(ProductModel product) async {
    emit(AddProductLoading());

    try {
      final result = await remoteDataSource.addProduct(
        product: product,
      );

      if (result) {
        emit(AddProductSuccess());
      } else {
        emit(AddProductError("Failed to add product"));
      }
    } catch (e) {
      emit(AddProductError(e.toString()));
    }
  }
}