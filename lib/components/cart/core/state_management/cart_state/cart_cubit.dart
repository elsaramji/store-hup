// components/cart/core/state_management/cart_state/cart_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/cart/core/services/firebase/data/cart_store_repo.dart';
import 'package:store_hup/core/custom/widgets/custom_errors_massage.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartFirebaseRepo cartStoreRepo = CartFirebaseRepo();
  CartCubit() : super(CartInitial());

  addToCart(CartItemEntity cart, BuildContext context) {
    try {
      cartStoreRepo.uploading(cart);
      emit(CartAdded(cart: cart));
      ErrorsMassage.errorsBar(context, "تم اضافة المنتج الى السلة");
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  removeFromCart(CartItemEntity cart) {
    try {
      cartStoreRepo.removed(cart);
      emit(CartRemoved(cart: cart));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  updateCart(CartItemEntity cart) {
    try {
      cartStoreRepo.updated(cart);
      emit(CartUpdated(cart: cart));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  getPay(List list, num pay) {
    list.forEach((element) {
      CartItemEntity cartItemEntity =
          CartItemEntity.fromMap(element as Map<String, dynamic>);
      pay += cartItemEntity.total;
    });
  }

  Stream<QuerySnapshot> getCart() {
    return cartStoreRepo.getCart();
  }

  List<dynamic> buildSharedData(Stream<QuerySnapshot> cartStream) {
    num totelPay = 0;
    List sharedData = [];
    cartStream.asBroadcastStream().listen((event) {
      sharedData[0] = event.docs.length;
      event.docs.forEach((element) {
        sharedData.add(element.data());
        totelPay +=
            CartItemEntity.fromMap(element.data() as Map<String, dynamic>)
                .total;
      });
    });
    sharedData.add(totelPay);
    return sharedData;
  }
}
