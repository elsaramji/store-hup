// components/navigation/widget/navigation_item.dart
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:store_hup/components/navigation/widget/active_item.dart';

import '../../../core/models/navigation_icon_entity.dart';
import 'un_active_item.dart';

// ignore: must_be_immutable
class CustomNavigtionItmes extends StatelessWidget {
  late bool isactive;
  final NavigationIconEntity navigationIconEntity;
  CustomNavigtionItmes(
      {super.key, this.isactive = false, required this.navigationIconEntity});

  @override
  Widget build(BuildContext context) {
    return isactive
        ? ActiveItem(
            navigationIconEntity: navigationIconEntity,
          )
        : UnActiveItem(
            navigationIconEntity: navigationIconEntity,
          );
  }
}