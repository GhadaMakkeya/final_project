import 'package:bloc/bloc.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_states.dart';
import 'package:veloura/features/home/data/data_source/remote_data_source.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    try {
      final products = await remoteDataSource.getProducts();
      emit(ProductsSuccessState(products: products));
    } catch (e) {
      emit(ProductsErrorState(errorMessage: 'Unexpected error'));
    }
  }
}
