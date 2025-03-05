// components/chackout/view/review_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        Column(children: [
          Text(
            "ملخص الطلب :",
            style: TextsStyle.bold13.copyWith(color: AppColors.grayscale950),
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            children: [
              Text(
                "المجموع الفرعي :",
                style: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale500),
              ),
              const Spacer(),
              Text(
                "50 جنية",
                style: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale950),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "التوصيل :",
                style: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale500),
              ),
              const Spacer(),
              Text(
                "50 جنية",
                style: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale950),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "الضريبة :",
                style: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale500),
              ),
              const Spacer(),
              Text(
                "50 جنية",
                style: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale950),
              ),
            ],
          ),
          Row(children: [
            Text(
              "المجموع الكلي :",
              style:
                  TextsStyle.regular13.copyWith(color: AppColors.grayscale500),
            ),
            const Spacer(),
            Text(
              "50 جنية",
              style:
                  TextsStyle.regular13.copyWith(color: AppColors.grayscale950),
            ),
          ])
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 23,
          ),
          Text("يرجي تأكيد  طلبك",
              style: TextsStyle.bold13.copyWith(color: AppColors.grayscale950)),
          const SizedBox(
            height: 23,
          ),
          const EditDivder(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "**** **** **** 6522",
                style: TextsStyle.regular16
                    .copyWith(color: AppColors.grayscale950),
              ),
              const SizedBox(
                width: 16,
              ),
              SvgPicture.asset(Assets.assetsImagesBadge),
            ],
          )
        ]),
        const EditDivder(),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
            ),
            Text(
              "شارع النيل، مبنى رقم ١٢٣",
              style:
                  TextsStyle.regular13.copyWith(color: AppColors.grayscale600),
            )
          ],
        ),
      ]),
    );
  }
}

class EditDivder extends StatelessWidget {
  const EditDivder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("وسيلة الدفع",
          style: TextsStyle.bold13.copyWith(color: AppColors.grayscale950)),
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.edit,
            color: AppColors.grayscale400,
          ),
          Text(
            "تغيير",
            style: TextsStyle.regular13.copyWith(color: AppColors.grayscale400),
          ),
        ],
      )
    ]);
  }
}
