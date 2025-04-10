import 'package:flutter/material.dart';
import 'package:store_hup/components/profile/views/oder_state_obsever.dart';
import 'package:store_hup/components/profile/views/user_oder_viwe.dart';
import 'package:store_hup/components/profile/views/widgets/order_deitles.dart';

class OrderObsever extends StatelessWidget {
  const OrderObsever({
    super.key,
    required this.isExpanded,
    required this.widget,
  });

  final bool isExpanded;
  final OrderItem widget;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isExpanded,
        child: Column(
          children: [
            Column(
              children: widget.order.cartItems!.map((e) {
                return Orderdeteils(
                  cartItemEntity: e,
                );
              }).toList(),
            ),
            OrderStateObsever(widget: widget),
          ],
        ));
  }
}
