// components/futures/onboarding/widgets/custom_boarding.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';


class CustomBoard extends StatelessWidget {
  final String subtitel, bacgroundpath, imagepath;
  final Widget title;
  const CustomBoard(
      {super.key,
      required this.subtitel,
      required this.bacgroundpath,
      required this.imagepath,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    bacgroundpath,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SvgPicture.asset(imagepath)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title,
                SizedBox(height: 16),
                Text(
                  subtitel,
                  textAlign: TextAlign.center,
                  style: TextsStyle.semibold13
                      .copyWith(color: AppColors.grayscale500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
