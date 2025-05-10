// features/cart/core/state_management/cart_state/cart_state.dart
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

class CartUpdated extends CartState {
  final CartItemEntity cart;
  CartUpdated({required this.cart});
}

class CartLoaded extends CartState {
  final List<CartItemEntity> carts;
  CartLoaded({required this.carts});
}

class CartError extends CartState {
  final String error;
  CartError({required this.error});
}
