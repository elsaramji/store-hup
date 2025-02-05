// components/Home/views/best_seller_viwe.dart
import 'package:flutter/material.dart';
import '../../../core/custom/widgets/CustomHome/custom_Page_Appbar.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';
import '../custom/widgets/product_stream_biluder.dart';

class BestSellerViwe extends StatefulWidget {
  static const String id = 'BestSeller';

  const BestSellerViwe({Key? key}) : super(key: key);

  @override
  State<BestSellerViwe> createState() => _BestSellerViweState();
}

class _BestSellerViweState extends State<BestSellerViwe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          const SliverToBoxAdapter(
            child: CustomPageAppbar(pagetitel: "الأكثر مبيعًا"),
          ),
          SliverToBoxAdapter(
            child: Text(
              "الأكثر مبيعًا",
              style: TextsStyle.bold16.copyWith(color: AppColors.grayscale950),
            ),
          ),
          const ProductsSreamBuilder(),
        ]),
      ),
    );
  }
}
