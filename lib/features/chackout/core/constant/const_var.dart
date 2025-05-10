// features/chackout/core/constant/const_var.dart

import 'package:flutter/widgets.dart';
import '../../../../features/chackout/view/address_info_view.dart';
import '../../../../features/chackout/view/review_view.dart';

List<String> titel() {
  return ["العنوان ", "المراجعة"];
}

List<Widget> views() {
  return [
    const AddressForm(),
    const Resete(),
  ];
}
