// components/chackout/core/constant/const_var.dart

import 'package:flutter/widgets.dart';
import 'package:store_hup/components/chackout/view/address_view.dart';
import 'package:store_hup/components/chackout/view/delivery_view.dart';
import 'package:store_hup/components/chackout/view/payment_view.dart';
import 'package:store_hup/components/chackout/view/review_view.dart';

List<String> titel() {
  return ['الدفع', 'الشحن', 'العنوان', 'التاكيد'];
}

List<Widget> views() {
  return [
    Delivery(),
    const Payment(),
    const Address(),
    const Review(),
  ];
}
