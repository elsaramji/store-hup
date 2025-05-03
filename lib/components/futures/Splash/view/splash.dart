// components/futures/Splash/view/splash.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_hup/components/futures/Splash/logics/splash_logic.dart';

import '../../../../core/assets/assets_image.dart';

class Splash extends StatefulWidget {
  static const String route = '/splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SplashLogic().goToApp(context); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(Assets.assetsImagesPlant)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsImagesLogo),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesEndofsplash,
                  width: MediaQuery.of(context).size.width)
            ],
          ),
        ],
      ),
    );
  }
}
