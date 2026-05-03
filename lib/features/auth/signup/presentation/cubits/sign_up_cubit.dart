import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/auth/signup/data/data_source/sign_up_remote_data_source.dart';
import 'package:veloura/features/auth/signup/data/models/sign_up_requist_model.dart';
import 'package:veloura/features/auth/signup/presentation/cubits/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  SignUpRemoteDataSource signUpRemoteDataSource = SignUpRemoteDataSource();

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    await signUpRemoteDataSource
        .signUp(
          SignUpRequistModel(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
          ),
        )
        .then(
          (_) {
            emit(SignUpSuccessState());
          },
          onError: (error) {
            emit(SignUpFailureState(errorMessage: error.toString()));
          },
        );
  }
}
