import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class PaddingHorizontal extends StatelessWidget {
  final Widget child;
  final double value;
  const PaddingHorizontal({Key? key, required this.child, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value.w),
      child: child,
    );
  }
}

class PaddingStart extends StatelessWidget {
  final Widget child;
  final double value;
  const PaddingStart({Key? key, required this.child, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: value.w),
      child: child,
    );
  }
}

class PaddingEnd extends StatelessWidget {
  final Widget child;
  final double value;
  const PaddingEnd({Key? key, required this.child, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: value.w),
      child: child,
    );
  }
}

class PaddingDynamic extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const PaddingDynamic({
    Key? key,
    required this.child,
    this.top = 0.0,
    this.bottom = 0.0,
    this.end = 0.0,
    this.start = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: end!.w,
        top: top!.h,
        start: start!.w,
        bottom: bottom!.h,
      ),
      child: child,
    );
  }
}

class MarginDynamic extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const MarginDynamic({
    Key? key,
    required this.child,
    this.top = 0.0,
    this.bottom = 0.0,
    this.end = 0.0,
    this.start = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        end: end!.w,
        top: top!.h,
        start: start!.w,
        bottom: bottom!.h,
      ),
      child: child,
    );
  }
}
