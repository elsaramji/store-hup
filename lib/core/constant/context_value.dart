import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextValue on BuildContext {
  double get height => MediaQuery.of(this).size.height.h;
  double get width => MediaQuery.of(this).size.width.w;
}
