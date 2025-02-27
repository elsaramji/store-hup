// components/futures/Auth/signin/widgets/loading.dart
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/core/styles/color_style.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitChasingDots(
      color: AppColors.primaryColor,
    );
  }
}
