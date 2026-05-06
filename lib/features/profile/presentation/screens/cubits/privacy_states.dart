abstract class PrivacyStates {}

class PrivacyInitial extends PrivacyStates {}

class PrivacyLoading extends PrivacyStates {}

class PrivacySuccess extends PrivacyStates {}

class PrivacyError extends PrivacyStates {
  final String errorMessage;
  PrivacyError({required this.errorMessage});
}
