import 'package:bloc/bloc.dart';
import 'package:veloura/features/home/data/data_source/remote_data_source.dart';
import 'package:veloura/features/home/data/models/category_model.dart';
import 'package:veloura/features/home/presentation/cubits/categery_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final RemoteDataSource remoteDataSource = RemoteDataSource();
  
  List<CategoryModel> categories = [];
  int selectedIndex = 0;

  CategoryCubit() : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      final result = await remoteDataSource.getCategories();
      categories = result; 

      if (categories.isEmpty) {
        emit(CategoryEmpty());
      } else {
        emit(CategorySuccess(categories));
      }
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }

  void selectCategory(int index) {
    selectedIndex = index;
    emit(CategorySuccess(categories)); 
  }
}