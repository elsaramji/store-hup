// components/navigation/view/solamon_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/styles/color_style.dart';

class SolamonNavigationBar extends StatefulWidget {
  int selectedIndex = 0;
  Function(int index) onTap;
  SolamonNavigationBar({super.key, required this.onTap, required this.selectedIndex});

  @override
  State<SolamonNavigationBar> createState() => _SolamonNavigationBarState();
}

class _SolamonNavigationBarState extends State<SolamonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
        currentIndex: widget.selectedIndex,
        items: [
          SalomonBottomBarItem(
            icon: SvgPicture.asset(Assets.assetsImagesBoildHome),
            title: const Text("الرئيسية"),
            selectedColor: AppColors.green600,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(Assets.assetsImagesBoildProducts),
            title: const Text("المنتجات"),
            selectedColor: AppColors.green600,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(Assets.assetsImagesBoildCart),
            title: const Text("السلة"),
            selectedColor: AppColors.green600,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(Assets.assetsImagesBoildUser),
            title: const Text("حسابي"),
            selectedColor: AppColors.green600,
          ),
        ],
        onTap: (index) {
          
          widget.onTap(index);
        });
  }
}
