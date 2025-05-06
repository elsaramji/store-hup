import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitBox extends StatelessWidget {
  final Widget child;
  const InitBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: Container(
            width: 1.0.sw,
            height: 1.0.sh,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: child,
          ),
        );
      },
    );
  }
}
