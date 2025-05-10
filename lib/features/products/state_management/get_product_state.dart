// features/products/state_management/get_product_state.dart
part of 'get_product_cubit.dart';

@immutable
abstract class GetProductState {}

class GetProductInitial extends GetProductState {}

class GetProductLoading extends GetProductState {}

class GetProductSuccess extends GetProductState {
  final List<Map<String, dynamic>> products;
  GetProductSuccess(this.products);
}

class GetProductError extends GetProductState {
  final String message;
  
  GetProductError(this.message);
}


