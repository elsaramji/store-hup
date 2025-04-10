import 'package:flutter/material.dart';
import 'package:store_hup/components/profile/views/user_oder_viwe.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class OrderStateObsever extends StatefulWidget {
  const OrderStateObsever({
    super.key,
    required this.widget,
  });

  final OrderItem widget;

  @override
  State<OrderStateObsever> createState() => _OrderStateObseverState();
}

class _OrderStateObseverState extends State<OrderStateObsever> {
  TextStyle? textStyle = TextsStyle.bold16.copyWith(
    color: AppColors.primaryColor,
  );
  double totalPrice = 0.0;
  initState() {
    widget.widget.order.cartItems!.forEach((element) {
      totalPrice += element.count * double.parse(element.product.price);
    });
    setState(() {
      totalPrice;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          child: Text(
            "تم الدفع",
            style: textStyle,
          ),
          visible: widget.widget.order.paymentOnline,
        ),
        Visibility(
          child: Text(
            "تم استلام الطلب",
            style: textStyle,
          ),
          visible: widget.widget.order.isChacked,
        ),
        Visibility(
            child: Text(
              "قيد المعالجة",
              style: textStyle,
            ),
            visible: !widget.widget.order.isChacked),
        Visibility(
          child: Text(
            "تم التوصيل",
            style: textStyle,
          ),
          visible: widget.widget.order.isDelivered,
        ),
        Visibility(
          child: Text(
            "تم الغاء الطلب",
            style: textStyle,
          ),
          visible: widget.widget.order.isCanceled,
        ),
        Visibility(
          child: Text(
            "تم استرداد الطلب",
            style: textStyle,
          ),
          visible: widget.widget.order.isRefunded,
        ),
        Text(
          "الاجمالي: ${totalPrice} \$",
          style: textStyle,
        ),
      ],
    );
  }
}
