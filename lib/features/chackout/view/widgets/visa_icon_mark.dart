// features/chackout/view/widgets/visa_icon_mark.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/assets_image.dart';

class VisaIconsMark extends StatelessWidget {
  const VisaIconsMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: SvgPicture.asset(
            Assets.assetsImagesBadge,
          ),
        ),
        Flexible(
          child: SvgPicture.asset(
            Assets.assetsImagesBadge1,
          ),
        ),
        Flexible(
          child: SvgPicture.asset(
            Assets.assetsImagesBadge2,
          ),
        ),
        Flexible(
          child: SvgPicture.asset(
            Assets.assetsImagesBadge3,
          ),
        ),
      ],
    );
  }
}
