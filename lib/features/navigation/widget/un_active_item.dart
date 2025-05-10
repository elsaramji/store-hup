// features/navigation/widget/un_active_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/models/navigation_icon_entity.dart';

class UnActiveItem extends StatelessWidget {
  final NavigationIconEntity navigationIconEntity;
  const UnActiveItem({super.key, required this.navigationIconEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: SvgPicture.asset(
        navigationIconEntity.unactiveimage,
        fit: BoxFit.fill,
      ),
    );
  }
}