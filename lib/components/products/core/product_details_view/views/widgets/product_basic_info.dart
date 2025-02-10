// components/products/core/product_details_view/views/widgets/product_basic_info.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/products/core/product_details_view/views/widgets/quantity_control.dart';

import '../../../../../../core/models/product.dart';
import '../../../../../../core/styles/color_style.dart';
import '../../../../../../core/styles/font_style.dart';
import '../../../../widget/product_card.dart';


class ImagePorductInfo extends StatelessWidget {
  const ImagePorductInfo({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
      child: Laodimage(product: product),
    );
  }
}

class BasicProductInfo extends StatelessWidget {
  const BasicProductInfo({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            product.name,
            style:
                TextsStyle.semibold16.copyWith(color: AppColors.grayscale950),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "${product.price} جنية",
                style: TextsStyle.bold16.copyWith(color: AppColors.orange500),
              ),
              TextSpan(
                text: "كيلو",
                style:
                    TextsStyle.semibold16.copyWith(color: AppColors.orange300),
              ),
            ]),
          ),
        ]),
        const Spacer(),
        QuantityController()
      ],
    );
  }
}
