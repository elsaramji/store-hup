// components/cart/core/state_management/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/cart/core/services/firebase/data/cart_store_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartStoreRepo cartStoreRepo;
  CartCubit({required this.cartStoreRepo}) : super(CartInitial());

  addToCart(CartItemEntity cart) {
    try {
      cartStoreRepo.uploading(cart);
      emit(CartAdded(cart: cart));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }
}
