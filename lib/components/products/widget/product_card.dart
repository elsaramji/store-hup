// components/products/widget/product_card.dart
// components/products_management/widget/product_card.dart
// ignore_for_file: dead_code

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store_hup/components/product_details_view/views/product_details%20_view.dart';
import 'package:store_hup/core/custom/Style/custom_buttons_style.dart';

import '../../../core/models/product.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final Function()? add;

  ProductCard({
    super.key,
    required this.product,
    required this.add,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailsView(product: widget.product));
      },
      child: AspectRatio(
        aspectRatio: 8 / 16,
        child: Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xffF3F5F7),
            child: Stack(children: <Widget>[
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Laodimage(product: widget.product),
                    ),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          widget.product.name,
                          style: TextsStyle.semibold19
                              .copyWith(color: AppColors.grayscale950),
                        ),
                        subtitle: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: "${widget.product.price} جنية",
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
                          onPressed: widget.add,
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
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : AppColors.grayscale500,
                    ),
                  )),
            ])),
      ),
    );
  }
}

class Laodimage extends StatelessWidget {
  const Laodimage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        filterQuality: FilterQuality.high,
        fit: BoxFit.contain,
        imageUrl: product.imageurl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(
              child: SpinKitFadingCube(
                color: AppColors.green1600,
              ),
            ));
  }
}
