import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/home/data/data_source/remote_data_source.dart';
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_states.dart';

class OffersCubit extends Cubit<OffersStates> {
  OffersCubit() : super(OffersInitialState());

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getOffers() async {
    emit(OffersLoadingState());
    await remoteDataSource.getOffers().then(
      (offersVal) {
        emit(OffersSuccessState(offers: offersVal));
      },
      onError: (error) {
        emit(
          OffersErrorState(
            errorMessage: error.toString().isNotEmpty
                ? error.toString()
                : "Something went wrong",
          ),
        );
      },
    );
  }
}
