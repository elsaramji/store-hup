// components/futures/Auth/signup/widgets/main_views.dart

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../../core/custom/widgets/custom_Appbar.dart';
import '../../../../../../core/custom/widgets/custom_loadingProgress.dart';
import '../../../../../../service/state_management/sginup_cubit/sginup_cubit.dart';
import '../view/signup_view_widget.dart';

class MainViews extends StatelessWidget {
  final state;
  const MainViews({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    log("build signup view main views");
    return Scaffold(
        appBar: customAppBar(
            context: context,
            title: 'تسجيل حساب',
            iconleading: const Icon(Icons.arrow_back_ios)),
        body: CustomLoadingProgress(
            isOn: state is SignupLoading ? true : false,
            child: const SignupView()));
  }
}
