// components/chackout/view/widgets/trans_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_hup/components/Home/views/home_view.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/cart/core/services/firebase/data/cart_store_repo.dart';
import 'package:store_hup/components/chackout/core/constant/const_var.dart';
import 'package:store_hup/components/chackout/core/model/ordermodel.dart';
import 'package:store_hup/components/chackout/core/services/order_repo.dart';
import 'package:store_hup/components/chackout/view/address_info_view.dart';
import 'package:store_hup/components/chackout/view/widgets/address_info_form.dart';
import 'package:store_hup/core/custom/widgets/custom_button.dart';
import 'package:store_hup/core/custom/widgets/custom_errors_massage.dart';
import 'package:store_hup/core/custom/widgets/custom_social_button.dart';
import 'package:store_hup/core/styles/color_style.dart';

class TransButtonsBuilder extends StatelessWidget {
  const TransButtonsBuilder({
    super.key,
    required this.controller,
    required this.index,
  });

  final PageController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: index != 0,
            child: Expanded(
              child: CustomSocialButton(
                title: "السابق",
                onTouch: () {
                  if (index > 0) {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                },
              ),
            ),
          ),
          SizedBox(
            width: index == 0 ? 0 : 16,
          ),
          Expanded(
            child: CustomButton(
              titel: index == titel().length - 1 ? "تاكيد" : "التالي",
              onPressed: () {
                switch (index) {
                  case 0:
                    if (AddressInfoForm.formkey.currentState!.validate()) {
                      AddressInfoForm.formkey.currentState!.save();
                      context.read<OrderRepo>().uploading(OrderModel(
                            cartItems: context.read<List<CartItemEntity>>(),
                            address: context.read<AddressModel>().address,
                            name: context.read<AddressModel>().name,
                            email: context.read<AddressModel>().email,
                            phone: context.read<AddressModel>().phone,
                            floor: context.read<AddressModel>().floor,
                            paymentOnline:
                                context.read<AddressModel>().paymentOnline,
                          ));
                      context.read<List<CartItemEntity>>().forEach((element) {
                        CartFirebaseRepo().removed(element);
                      });
                      controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    } else {
                      ErrorsMassage.errorsBar(context, "يجب ملء جميع الخانات");
                    }
                    break;
                  case 1:
                    //exit dialog
                    Get.to(HomeMainView());
                    break;
                }
              },
              titelcolor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
