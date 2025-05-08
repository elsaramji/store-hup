// components/chackout/view/address_info_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/chackout/view/widgets/address_info_form.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/custom/widgets/custom_button.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';
import 'package:store_hup/service/paymet/stripe_payment.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  @override
  Widget build(BuildContext context) {
    bool isOnline = context.read<AddressModel>().paymentOnline;
    double totelCart() {
      double totelCart = 0;

      context.read<List<CartItemEntity>>().forEach(
        (element) {
          totelCart += double.parse(element.product.price) * element.count;
        },
      );
      return totelCart;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddressInfoForm(
              addressModel: context.read<AddressModel>(),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(children: [
                   Text("الاجمالي", style: TextsStyle.regular16),
                  const Spacer(),
                  Text("${totelCart()} جنية", style: TextsStyle.bold16)
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      Assets.assetsImagesBadge,
                      fit: BoxFit.contain,
                    ),
                    SvgPicture.asset(
                      Assets.assetsImagesBadge1,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                CustomButton(
                    titel: isOnline ? "تم الدفع" : "ادفع ${totelCart()} جنية",
                    onPressed: () async {
                      await StripePayment.makePayment(
                          (totelCart() * 100).toInt());
                      isOnline = !isOnline;
                    },
                    titelcolor: AppColors.white)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddressModel {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? floor;
  bool paymentOnline = false;
}
