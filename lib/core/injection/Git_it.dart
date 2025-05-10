// core/injection/Git_it.dart


import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../features/cart/core/services/firebase/data/cart_store_repo.dart';
import '../../features/chackout/core/services/order_repo.dart';
import '../../features/products/service/firebase/products_firestore_service.dart';
import '../../service/database/presence.dart';
import 'firebase/auth/auth_service.dart';
import 'firebase/data/firebaseDataService.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  try {
    getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
    getIt.registerSingleton<ProductsFirestoreService>(
        ProductsFirestoreService());
    getIt.registerSingleton<CartFirebaseRepo>(CartFirebaseRepo());
    getIt.registerSingleton<OrderRepo>(OrderRepo());
    getIt.registerSingleton<FirebaseDataService>(FirebaseDataService());
    getIt.registerSingleton<Preferences>(Preferences());
  } catch (e) {
    log(e.toString());
  }
}
