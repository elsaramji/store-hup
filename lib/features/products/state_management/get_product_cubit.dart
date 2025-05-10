// features/products/state_management/get_product_cubit.dart
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../features/products/service/firebase/products_firestore_service.dart';
import '../../../core/injection/Git_it.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit() : super(GetProductInitial());

  void getProduct() async {
    emit(GetProductLoading());
    try {
      final products = await getIt<ProductsFirestoreService>().getProduct();
      emit(GetProductSuccess(products));
    } catch (e) {
      log(e.toString());
      emit(GetProductError(e.toString()));
    }
  }
}
