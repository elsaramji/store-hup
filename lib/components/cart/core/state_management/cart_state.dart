// components/cart/core/state_management/cart_state.dart
part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartAdded extends CartState {
  final CartItemEntity cart;
  CartAdded({required this.cart});
}

class CartRemoved extends CartState {
  final CartItemEntity cart;
  CartRemoved({required this.cart});
}

class CartError extends CartState {
  final String error;
  CartError({required this.error});
}
