// components/products/core/custom/views/product_details _view.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_hup/components/products/widget/product_card.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/custom/Style/custom_buttons_style.dart';
import 'package:store_hup/core/models/product.dart';

import '../../../../../core/styles/color_style.dart';
import '../../../../../core/styles/font_style.dart';

class ProductDetailsView extends StatefulWidget {
  static String routeName = '/ProductDetailsView';
  final Product product;

  ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int lenght_details = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
              child: Laodimage(product: widget.product),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    widget.product.name,
                    style: TextsStyle.semibold16
                        .copyWith(color: AppColors.grayscale950),
                  ),
                  Text.rich(
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
                ]),
                const Spacer(),
                QuantityController()
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (lenght_details == 150) {
                      lenght_details = widget.product.description.length;
                    } else {
                      lenght_details = 150;
                    }
                  });
                },
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: widget.product.description.length >= lenght_details
                        ? widget.product.description
                            .substring(0, lenght_details)
                        : widget.product.description,
                    style: TextsStyle.regular16
                        .copyWith(color: AppColors.grayscale400),
                  ),
                  TextSpan(
                    text: widget.product.description.length == lenght_details
                        ? ""
                        : " المزيد...",
                    style: TextsStyle.regular16
                        .copyWith(color: AppColors.orange500),
                  ),
                ]))),
          ),
          SliverToBoxAdapter(
            child: Row(children: [
              ExpireDate(widget: widget),
              SvgPicture.asset(Assets.assetsImagesLotus)
            ]),
          )
        ]),
      ),
    ));
  }
}

class ExpireDate extends StatelessWidget {
  const ExpireDate({
    super.key,
    required this.widget,
  });

  final ProductDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Text("الصلاحية",
              style: TextsStyle.bold16.copyWith(
                color: AppColors.green600,
              )),
          Text(
            "${widget.product.dateofexpire} ",
            style: TextsStyle.regular16.copyWith(
              color: AppColors.grayscale600,
            ),
          )
        ]),
        SvgPicture.asset(
          Assets.assetsImagesCalendar,
          height: 64,
        ),
      ],
    );
  }
}

class QuantityController extends StatefulWidget {
  int quantity = 1;
  QuantityController({
    super.key,
  });
  int get getquantity => quantity;
  @override
  State<QuantityController> createState() => _QuantityControllerState();
}

class _QuantityControllerState extends State<QuantityController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: CustomButtonsStyle.primeryButtonstyle.copyWith(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
          ),
          onPressed: () {
            setState(() {
              widget.quantity++;
            });
          },
          icon: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          "${widget.quantity}",
          style: TextsStyle.bold19.copyWith(color: AppColors.grayscale950),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.quantity--;
            });
          },
          child: const Icon(
            Icons.remove,
            color: AppColors.grayscale200,
          ),
        ),
      ],
    );
  }
}
