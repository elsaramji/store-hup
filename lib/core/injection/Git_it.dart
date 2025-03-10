// core/injection/Git_it.dart
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:store_hup/components/cart/core/services/firebase/data/cart_store_repo.dart';
import 'package:store_hup/components/chackout/core/services/order_repo.dart';
import 'package:store_hup/components/products/service/firebase/products_firestore_service.dart';
import 'package:store_hup/service/database/presence.dart';

import '../../service/firebase/auth/auth_service.dart';
import '../../service/firebase/data/firebaseDataService.dart';

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
