// components/chackout/view/widgets/payment_choice_selector.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/view/active_item.dart';
import 'package:store_hup/components/chackout/view/un_active_item.dart';

// ignore: must_be_immutable
class SelctorPayment extends StatelessWidget {
  bool isactive;
  final String titel, suptitel, trailing;
  SelctorPayment(
      {super.key,
      this.isactive = false,
      required this.titel,
      required this.suptitel,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return isactive
        ? ActiveSelcetPaymentData(
            titel: titel,
            suptitel: suptitel,
            trailing: trailing,
          )
        : UnActiveSelcetPaymentData(
            titel: titel,
            suptitel: suptitel,
            trailing: trailing,
          );
  }
}