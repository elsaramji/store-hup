
import 'package:flutter/material.dart';
import 'package:store_hup/components/profile/views/user_oder_viwe.dart';

class OrderStateObsever extends StatelessWidget {
  const OrderStateObsever({
    super.key,
    required this.widget,
  });

  final OrderItem widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          child: const Text("تم الدفع"),
          visible: widget.order.paymentOnline,
        ),
        Visibility(
          child: const Text("تم استلام الطلب"),
          visible: widget.order.isChacked,
        ),
        Visibility(
            child: const Text("قيد المعالجة"),
            visible: !widget.order.isChacked),
        Visibility(
          child: const Text("تم التوصيل"),
          visible: widget.order.isDelivered,
        ),
        Visibility(
          child: const Text("تم الغاء الطلب"),
          visible: widget.order.isCanceled,
        ),
        Visibility(
          child: const Text("تم استرداد الطلب"),
          visible: widget.order.isRefunded,
        ),
      ],
    );
  }
}
