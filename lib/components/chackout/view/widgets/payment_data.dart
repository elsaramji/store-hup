// components/chackout/view/widgets/payment_data.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_hup/components/chackout/view/edit_divider.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class Paymentdata extends StatelessWidget {
  final bool isOnline;
  const Paymentdata({
    this.isOnline = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("يرجي تأكيد  طلبك",
          style: TextsStyle.bold13.copyWith(color: AppColors.grayscale950)),
      const SizedBox(
        height: 23,
      ),
      const EditDivder(
        title: "معلومات الدفع",
      ),
      isOnline
          ? Row(children: [
              Flexible(child: SvgPicture.asset(Assets.assetsImagesBadge1)),
              const Spacer(),
              Text(" تم الدفع عن طريق البطاقة البنكية",
                  style: TextsStyle.regular16
                      .copyWith(color: AppColors.grayscale950))
            ])
          : Text("الدفع عند الاستلام",
              style:
                  TextsStyle.regular16.copyWith(color: AppColors.grayscale950))
    ]);
  }
}
