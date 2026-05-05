part of 'management_cubit.dart';

abstract class ManagementState {}

class ManagementInitial extends ManagementState {}

class ManagementLoading extends ManagementState {}

class ManagementSuccess extends ManagementState {
  final List<Product> products;
  ManagementSuccess(this.products);
}

class ManagementError extends ManagementState {
  final String message;
  ManagementError(this.message);
}