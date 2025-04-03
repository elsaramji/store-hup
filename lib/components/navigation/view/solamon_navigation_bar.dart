// components/navigation/view/solamon_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:store_hup/components/cart/core/state_management/cart_state/cart_cubit.dart';
import 'package:store_hup/core/assets/assets_image.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

// ignore: must_be_immutable
class SolamonNavigationBar extends StatefulWidget {
  int selectedIndex = 0;
  Function(int index) onTap;
  SolamonNavigationBar(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  State<SolamonNavigationBar> createState() => _SolamonNavigationBarState();
}

class _SolamonNavigationBarState extends State<SolamonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<CartCubit>().getCart(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: SpinKitChasingDots(
                color: AppColors.green600,
              ),
            );
          }
          ;
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
                  icon: Stack(
                    children: [
                      SvgPicture.asset(Assets.assetsImagesBoildCart),
                      Visibility(
                        visible: snapshot.data!.docs.length > 0,
                        child: Positioned(
                          top: 0,
                          right: 0,
                          child: Stack(
                            children: [
                              const Icon(
                                Icons.brightness_1,
                                size: 15,
                                color: Colors.red,
                              ),
                              Positioned(
                                right: 3,
                                left: 0,
                                child: Text(
                                  "${snapshot.data!.docs.length}",
                                  style: TextsStyle.bold11
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
        });
  }
}
