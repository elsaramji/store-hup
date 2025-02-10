// components/products/core/custom/views/product_details _view.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_hup/components/products/widget/product_card.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/custom/Style/custom_buttons_style.dart';
import 'package:store_hup/core/custom/widgets/custom_button.dart';
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
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 64),
                  child: Laodimage(product: widget.product),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                        text:
                            widget.product.description.length >= lenght_details
                                ? widget.product.description
                                    .substring(0, lenght_details)
                                : widget.product.description,
                        style: TextsStyle.regular16
                            .copyWith(color: AppColors.grayscale400),
                      ),
                      TextSpan(
                        text:
                            widget.product.description.length == lenght_details
                                ? ""
                                : " المزيد...",
                        style: TextsStyle.regular16
                            .copyWith(color: AppColors.orange500),
                      ),
                    ]))),
              ),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 16)),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(children: [
                      InfoItem(
                        title: "انتهاء الصلاحية",
                        subtitle: widget.product.dateofexpire,
                        imagePath: Assets.assetsImagesCalendar,
                      ),
                      const Spacer(),
                      InfoItem(
                        title: widget.product.isOrganic
                            ? "%100 زراعى"
                            : "غير زراعى",
                        subtitle: "اوجانيك",
                        imagePath: Assets.assetsImagesLotus,
                      ),
                    ]),
                    const SizedBox(
                      height: 16,
                    ),
                    InfoItem(
                      title: "${widget.product.calories} كالورى",
                      subtitle: "100 جرام",
                      imagePath: Assets.assetsImagesCalories,
                    ),
                  ],
                ),
              ),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 32)),
              SliverToBoxAdapter(
                child: CustomButton(
                  titel: "اضافة الى السلة",
                  onPressed: () {},
                  titelcolor: AppColors.white,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
            ]),
          ),
        ));
  }
}

class InfoItem extends StatelessWidget {
  final String title, subtitle, imagePath;

  const InfoItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          height: 64,
        ),
        Column(children: [
          Text(title,
              style: TextsStyle.bold16.copyWith(
                color: AppColors.green600,
              )),
          Text(
            subtitle,
            style: TextsStyle.regular16.copyWith(
              color: AppColors.grayscale600,
            ),
          )
        ]),
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
