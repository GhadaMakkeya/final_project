import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/home/data/models/product_model.dart';
import 'package:veloura/features/managment/data/services/product_service.dart';

part 'management_state.dart';

class ManagementCubit extends Cubit<ManagementState> {
  final ProductService _service = ProductService();
  List<ProductModel> products = [];

  ManagementCubit() : super(ManagementInitial());

  Future<void> fetchAllProducts() async {
    emit(ManagementLoading());
    try {
      products = await _service.getProducts();
      emit(ManagementSuccess(products));
    } catch (e) {
      emit(ManagementError("حدث خطأ أثناء تحميل المنتجات: ${e.toString()}"));
    }
  }

  Future<bool> deleteProduct(String id) async {
    final success = await _service.deleteProduct(id);
    if (success) {
      products.removeWhere((product) => product.id == id);
      emit(ManagementSuccess(List.from(products)));
    }
    return success;
  }
}