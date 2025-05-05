import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_hup/components/futures/onboarding/widgets/skip.dart';
import 'package:store_hup/core/assets/assets_image.dart';

class OnBordingBackground extends StatelessWidget {
  final String bacgroundpathone = Assets.assetsImagesBackgroundonboardingone;
  final String bacgroundpathtow = Assets.assetsImagesBackgroundonboardingtow;
  final int index;
  const OnBordingBackground({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          index > 0 ? bacgroundpathtow : bacgroundpathone,
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
        Visibility(
          visible: index <= 0,
          child: Container(
            color: Colors.white.withAlpha(150),
            child: const Align(
              alignment: Alignment.topRight,
              child: Skip(),
            ),
          ),
        )
      ],
    );
  }
}
