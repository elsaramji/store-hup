// components/chackout/view/widgets/order_payment_data.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/core/model/ordermodel.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class Orderpaydata extends StatelessWidget {
  const Orderpaydata({
    super.key,
    required this.orderModel,
    required this.totelCart,
  });

  final OrderModel orderModel;
  final double totelCart;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 23,
      ),
      Text(
        "ملخص الطلب رقم  : ${orderModel.id}",
        style: TextsStyle.bold16.copyWith(color: AppColors.grayscale950),
      ),
      const SizedBox(
        height: 23,
      ),
      Row(
        children: [
          Text(
            "المجموع الفرعي :",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale500),
          ),
          const Spacer(),
          Text(
            "$totelCart جنية",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale950),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            "التوصيل :",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale500),
          ),
          const Spacer(),
          Text(
            "50 جنية",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale950),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            "الضريبة :",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale500),
          ),
          const Spacer(),
          Text(
            "00 جنية",
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale950),
          ),
        ],
      ),
      Row(children: [
        Text(
          "المجموع الكلي :",
          style: TextsStyle.regular16.copyWith(color: AppColors.grayscale500),
        ),
        const Spacer(),
        Text(
          "${totelCart + 50}جنية",
          style: TextsStyle.regular16.copyWith(color: AppColors.grayscale950),
        ),
      ])
    ]);
  }
}
