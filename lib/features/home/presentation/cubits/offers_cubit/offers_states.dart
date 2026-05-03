import 'package:veloura/features/home/data/models/offers_data.dart';

abstract class OffersStates {}

class OffersInitialState extends OffersStates {}

class OffersLoadingState extends OffersStates {}

class OffersSuccessState extends OffersStates {
  final List<OffersData> offers;
  OffersSuccessState({required this.offers});
}

class OffersErrorState extends OffersStates {}
