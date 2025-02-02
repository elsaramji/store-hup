// components/products/widget/product_card.dart
// components/products_management/widget/product_card.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/custom/Style/custom_buttons_style.dart';
import '../../../core/models/product.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 16,
      child: Container(
          padding: const EdgeInsets.all(8),
          color: AppColors.grayscale50.withOpacity(0.3),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        imageUrl: product.imageurl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                                  child: SpinKitFadingCube(
                                    color: AppColors.green1600,
                                  ),
                                )),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        product.name,
                        style: TextsStyle.semibold19
                            .copyWith(color: AppColors.grayscale950),
                      ),
                      subtitle: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: "${product.price} جنية",
                            style: TextsStyle.bold16
                                .copyWith(color: AppColors.orange500),
                          ),
                          TextSpan(
                            text: "كيلو",
                            style: TextsStyle.semibold16
                                .copyWith(color: AppColors.orange300),
                          ),
                        ]),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                        style: CustomButtonsStyle.primeryButtonstyle.copyWith(
                            shape:
                                const WidgetStatePropertyAll(CircleBorder())),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.sell_rounded,
                    color: AppColors.grayscale950,
                  ),
                )),
          ])),
    );
  }
}
