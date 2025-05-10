// features/chackout/view/payment_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/chackout/view/address_info_view.dart';
import '../../../core/custom/widgets/custom_button.dart';
import '../../../core/styles/color_style.dart';
import '../../../service/paymet/stripe_payment.dart';

class Payment extends StatelessWidget {
  Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: CustomButton(
            titel: "ادفع الان",
            onPressed: () {
              context.read<AddressModel>().paymentOnline = true;
              StripePayment.makePayment((100 * 100));
            },
            titelcolor: AppColors.white),
      ),
    );
  }
}
