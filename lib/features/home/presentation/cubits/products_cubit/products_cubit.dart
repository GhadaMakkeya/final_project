import 'package:bloc/bloc.dart';
import 'package:veloura/features/home/data/models/product_data_model.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_states.dart';
import 'package:veloura/features/home/data/data_source/remote_data_source.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  List<ProductDataModel> allProducts = [];

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    try {
      final productsVal = await remoteDataSource.getProducts();

      // 2. بنخزن المنتجات في اللستة قبل ما نبعت الـ Success
      allProducts = productsVal;

      emit(ProductsSuccessState(products: productsVal));
    } catch (error) {
      emit(ProductsErrorState(errorMessage: error.toString()));
    }
  }
}
