/*import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:veloura/features/managment/data/data_sources/add_product_remote_data_source.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';

part 'add_product_state.dart';
class AddProductCubit extends Cubit<AddProductState> {
  final ProductRemoteDataSource productRemoteDataSource;

  AddProductCubit(this.productRemoteDataSource) : super(AddProductInitial());

  Future<void> addProduct(ProductModel product) async {
    emit(AddProductLoading());
    try {
      await productRemoteDataSource.addProduct(product: product, token: '');
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductError(e.toString()));
    }
  }
}*/