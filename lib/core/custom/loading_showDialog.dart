  import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../styles/color_style.dart';

Future loadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return const Center(
          child: SpinKitFadingCircle(
            color: AppColors.primaryColor,
            size: 50.0,
          ),
        );
      },
    );
  }
