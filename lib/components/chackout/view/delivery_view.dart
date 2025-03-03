// components/chackout/view/delivery_view.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/view/widgets/payment_choice_selector.dart';

class Delivery extends StatefulWidget {
  bool isAcitveChoiesone = false;
  bool isAcitveChoiestwo = true;
  Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          if (widget.isAcitveChoiestwo == false) {
            setState(() {
              widget.isAcitveChoiesone = !widget.isAcitveChoiesone;
            });
          } else {
            setState(() {
              widget.isAcitveChoiesone = !widget.isAcitveChoiestwo;
            });
          }
        },
        child: SelctorPayment(
          isactive: widget.isAcitveChoiesone,
          titel: "الدفع عند الاستلام",
          suptitel: "ادفع كاش",
          trailing: "400جنيه",
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      GestureDetector(
        onTap: () {
          if (widget.isAcitveChoiesone == false) {
            setState(() {
              widget.isAcitveChoiestwo = !widget.isAcitveChoiestwo;
            });
          } else {
            setState(() {
              widget.isAcitveChoiestwo = !widget.isAcitveChoiesone;
            });
          }
        },
        child: SelctorPayment(
          isactive: widget.isAcitveChoiestwo,
          titel: "ادفع اونلاين",
          suptitel: "استخدم بطاقة الائتمان",
          trailing: "400جنيه",
        ),
      ),
      const Spacer()
    ]);
  }
}

// ignore: must_be_immutable
