// features/Home/widgets/offers/offers_scroll.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/assets/assets_image.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../../custom/widgets/custom_button_items.dart';

class OffersScroll extends StatelessWidget {
  const OffersScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const OffersItem(),
      itemCount: 5,
    ));
  }
}

class OffersItem extends StatelessWidget {
  const OffersItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: SvgPicture.asset(
                Assets.assetsImagesPineappleonbording,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  child: SvgPicture.asset(
                    Assets.assetsImagesOfferFuture,
                    fit: BoxFit.fitHeight,
                  ),
                )),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("عرض العيد",
                          style: TextsStyle.regular13.copyWith(
                            color: AppColors.white,
                          )),
                      Text(
                        "خصم %25",
                        style: TextsStyle.bold19.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      CustomButtonItem(
                          titel: "تسوق الان",
                          onPressed: () {},
                          titelcolor: AppColors.primaryColor),
                    ]),
              ),
            ),
          ])),
    );
  }
}
