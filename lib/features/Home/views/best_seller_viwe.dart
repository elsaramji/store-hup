// features/Home/views/best_seller_viwe.dart
import 'package:flutter/material.dart';

import '../../../core/custom/widgets/CustomHome/custom_Page_Appbar.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class BestSellerViwe extends StatefulWidget {
  static const String id = 'BestSeller';
  const BestSellerViwe({Key? key}) : super(key: key);
  @override
  State<BestSellerViwe> createState() => _BestSellerViweState();
}

// ignore: must_be_immutable

class _BestSellerViweState extends State<BestSellerViwe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: CustomPageAppbar(pagetitel: "الأكثر مبيعًا"),
            ),
            SliverToBoxAdapter(
              child: Text(
                "الأكثر مبيعًا",
                style:
                    TextsStyle.bold16.copyWith(color: AppColors.grayscale950),
              ),
            ),
          
          ]),
        ),
      ),
    );
  }
}
