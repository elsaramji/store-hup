// components/Home/custom/widgets/custom_bast_seller.dart
import 'package:flutter/material.dart';


import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../../views/best_seller_viwe.dart';

class BastSellerBar extends StatelessWidget {
  const BastSellerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BestSellerViwe.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "الأكثر مبيعًا",
                style:
                    TextsStyle.bold16.copyWith(color: AppColors.grayscale950),
              ),
              const Spacer(),
              Text(
                "المزيد...",
                style: TextsStyle.regular13
                    .copyWith(color: AppColors.grayscale400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
