// components/futures/onboarding/widgets/custom_boarding.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_hup/core/constant/context_value.dart';

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
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.5,
          child: Stack(
            children: [
              SvgPicture.asset(
                bacgroundpath,
                fit: BoxFit.fill,
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 40.h,
                  child: SvgPicture.asset(imagepath)),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        title,
        Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              subtitel,
              textAlign: TextAlign.center,
              style: TextsStyle.semibold13
                  .copyWith(color: AppColors.grayscale500),
            ))
      ],
    );
  }
}
