// components/chackout/core/state_management/order_cubit.dart
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_hup/components/chackout/core/model/ordermodel.dart';
import 'package:store_hup/components/chackout/core/services/order_repo.dart';
part 'order_state.dart';


 
class OrderCubit extends Cubit<OrderState> {

  OrderCubit() : super(OrderInitial());
static String generateOrderId() {
    // Get the current date
    final DateTime now = DateTime.now();
    final String datePart =
        "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";

    // Generate a random 4-digit number
    final Random random = Random();
    final String uniquePart = random.nextInt(10000).toString().padLeft(4, '0');

    // Combine parts to create the product code
    return "$datePart-$uniquePart";
  }
  void addOrder(OrderModel orderModel) {
    emit(OrderLoading());
    try {
      OrderRepo().uploading(orderModel, generateOrderId());
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderError());
    }
  }

  void updateOrder(OrderModel orderModel)  {
    emit(OrderLoading());
    try {
       OrderRepo().update(orderModel);
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderError());
    }
  }
}
