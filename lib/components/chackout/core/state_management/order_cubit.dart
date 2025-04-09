// components/chackout/core/state_management/order_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_hup/components/chackout/core/model/ordermodel.dart';
import 'package:store_hup/components/chackout/core/services/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  String? orderId;

  void addOrder(OrderModel orderModel) {
    emit(OrderLoading());
    try {
      OrderRepo().uploading(orderModel);
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderError());
    }
  }

  void updateOrder(OrderModel orderModel) {
    emit(OrderLoading());
    try {
      OrderRepo().update(orderModel);
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderError());
    }
  }

  futchOrder() {
    try {
      emit(OrderLoading());
      var data = OrderRepo().getOrder();
      emit(OrderSuccess());
      return data;
    } catch (e) {
      emit(OrderError());
      return Future.error(e);
    }
  }
}
