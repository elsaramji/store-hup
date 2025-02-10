// components/products/core/product_details_view/views/widgets/product_info_itmes.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/products/core/product_details_view/views/widgets/product_info_item.dart';

import '../../../../../../core/assets/assets_image.dart';
import '../../../../../../core/models/product.dart' show Product;

class ProductInfoItems extends StatelessWidget {
  const ProductInfoItems({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          InfoItem(
            title: "انتهاء الصلاحية",
            subtitle: product.dateofexpire,
            imagePath: Assets.assetsImagesCalendar,
          ),
          const Spacer(),
          InfoItem(
            title: product.isOrganic ? "%100 زراعى" : "غير زراعى",
            subtitle: "اوجانيك",
            imagePath: Assets.assetsImagesLotus,
          ),
        ]),
        const SizedBox(
          height: 16,
        ),
        InfoItem(
          title: "${product.calories} كالورى",
          subtitle: "100 جرام",
          imagePath: Assets.assetsImagesCalories,
        ),
      ],
    );
  }
}
