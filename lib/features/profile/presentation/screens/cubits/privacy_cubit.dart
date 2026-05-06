import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/profile/data/privacy_remote_data_source.dart';
import 'privacy_states.dart';

class PrivacyCubit extends Cubit<PrivacyStates> {
  final PrivacyRemoteDataSource privacyDataSource;

  PrivacyCubit({required this.privacyDataSource}) : super(PrivacyInitial());

  Future<void> getPrivacyPolicy() async {
    emit(PrivacyLoading());
    try {
      await privacyDataSource.fetchPrivacyPolicy();
      emit(PrivacySuccess());
    } catch (e) {
      emit(PrivacyError(errorMessage: e.toString()));
    }
  }
}
