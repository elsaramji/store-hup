// features/chackout/view/widgets/page_steps.dart
import 'package:flutter/material.dart';

import '../../core/constant/const_var.dart';

class PageOrderSteps extends StatelessWidget {
  const PageOrderSteps({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return views()[index];
          },
          controller: controller,
          itemCount: titel().length),
    );
  }
}
