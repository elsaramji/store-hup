// core/custom/widgets/custom_loadingProgress.dart

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomLoadingProgress extends StatelessWidget {
  final bool isOn;
  final Widget child;
  const CustomLoadingProgress(
      {super.key, required this.isOn, required this.child});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isOn,
      child: child,
    );
  }
}
