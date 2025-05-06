import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextValue on BuildContext {
  double get height => MediaQuery.of(this).size.height.h;
  double get width => MediaQuery.of(this).size.width.w;
  Widget get verticalSizedBox5 => SizedBox(height: 5.h);
  Widget get verticalSizedBox10 => SizedBox(height: 10.h);
  Widget get verticalSizedBox20 => SizedBox(height: 20.h);
  Widget get verticalSizedBox30 => SizedBox(height: 30.h);
  Widget get verticalSizedBox40 => SizedBox(height: 40.h);
  Widget get verticalSizedBox50 => SizedBox(height: 50.h);
  Widget get verticalSizedBox8 => SizedBox(height: 8.h);
  Widget get verticalSizedBox16 => SizedBox(height: 16.h);
  Widget get verticalSizedBox24 => SizedBox(height: 24.h);
  Widget get verticalSizedBox32 => SizedBox(height: 32.h);
  Widget get verticalSizedBox48 => SizedBox(height: 48.h);
  EdgeInsetsGeometry get marginHorizontal8 =>
      EdgeInsets.symmetric(horizontal: 8.w);
  EdgeInsetsGeometry get marginHorizontal16 =>
      EdgeInsets.symmetric(horizontal: 16.w);
  EdgeInsetsGeometry get marginHorizontal24 =>
      EdgeInsets.symmetric(horizontal: 24.w);
  EdgeInsetsGeometry get marginHorizontal32 =>
      EdgeInsets.symmetric(horizontal: 32.w);
  EdgeInsetsGeometry get marginHorizontal40 =>
      EdgeInsets.symmetric(horizontal: 40.w);
}
