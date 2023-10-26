import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Inova/presentation/core/reusable_widgets/padding.dart';
import 'package:Inova/presentation/utils/colors.dart';

import '../../utils/textstyles.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final BoxFit? boxFit;
  final String backGroundImg;
  final double? topMargin;
  final double? bottomMargin;
  final double? startMargin;
  final double? endMargin;
  final double? topPadding;
  final double? bottomPadding;
  final double? startPadding;
  final double? endPadding;
  final double? borderRadius;
  final double? width;
  final double? height;
  final bool isElevated;
  final double xShadow;
  final bool isCircle;
  final double yShadow;
  final Color? color;
  final Color shadowColor;
  final Color? borderColor;
  final void Function()? onPressed;

  const AppContainer({
    Key? key,
    this.child,
    this.boxFit = BoxFit.none,
    this.backGroundImg = "",
    this.onPressed,
    this.topMargin = 0.0,
    this.isElevated = false,
    this.color = AppColors.backGroundColor,
    this.shadowColor = AppColors.secondaryColor,
    this.borderColor,
    this.topPadding = 0.0,
    this.endMargin = 0.0,
    this.endPadding = 0.0,
    this.startMargin = 0.0,
    this.startPadding = 0.0,
    this.bottomMargin = 0.0,
    this.bottomPadding = 0.0,
    this.borderRadius = 0.0,
    this.xShadow = 1.0,
    this.yShadow = 4.0,
    this.isCircle = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
          image: backGroundImg.isEmpty
              ? null
              : DecorationImage(
                  image: AssetImage(
                    backGroundImg,
                  ),
                  fit: boxFit,
                ),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          boxShadow: !isElevated
              ? []
              : [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    blurRadius: 2.5.w,
                    spreadRadius: -2.0.w,
                    offset: Offset(
                        xShadow.w, yShadow.h), // shadow direction: bottom right
                  )
                ],
          color: color,
          border: borderColor == null ? null : Border.all(color: borderColor!),
          borderRadius: isCircle ? null : BorderRadius.circular(borderRadius!),
        ),
        margin: EdgeInsetsDirectional.only(
          end: endMargin!.w,
          top: topMargin!.h,
          start: startMargin!.w,
          bottom: bottomMargin!.h,
        ),
        padding: EdgeInsetsDirectional.only(
          end: endPadding!.w,
          top: topPadding!.h,
          start: startPadding!.w,
          bottom: bottomPadding!.h,
        ),
        child: child,
      ),
    );
  }
}

class HeightBox extends StatelessWidget {
  final double number;
  const HeightBox(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: number.h);
  }
}

class WidthBox extends StatelessWidget {
  final double number;
  const WidthBox(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: number.w);
  }
}

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final String title;
  final bool hasBackButton;
  final bool resizeToAvoidBottomInset;
  final bool hasAppBar;
  final bool hasCart;

  const AppScaffold(
      {super.key,
      required this.body,
      this.hasBackButton = false,
      this.resizeToAvoidBottomInset = false,
      this.hasAppBar = false,
      this.hasCart = false,
      required this.title,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        elevation: 0,
        leading: hasBackButton
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : Container(),
        backgroundColor: Colors.transparent,
        title: PrimaryTextSemiBold(
          text: title,
          fontSize: 20,
          color: AppColors.black,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backGroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class AppColumn extends StatelessWidget {
  List<Widget> children;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  AppColumn({
    Key? key,
    required this.children,
    this.top = 0.0,
    this.bottom = 0.0,
    this.start = 0.0,
    this.end = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingDynamic(
      start: start,
      bottom: bottom,
      top: top,
      end: end,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class AppSeparator extends StatelessWidget {
  final double width;
  final double bottomPadding;
  final Color? color;
  final double topPadding;
  final double startPadding;
  final double endPadding;
  final double thickness;

  const AppSeparator({
    Key? key,
    required this.width,
    this.bottomPadding = 0.0,
    this.topPadding = 0.0,
    this.startPadding = 0.0,
    this.endPadding = 0.0,
    this.thickness = 0.5,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingDynamic(
      bottom: bottomPadding,
      top: topPadding,
      start: startPadding,
      end: endPadding,
      child: Container(
        color: color ?? AppColors.mainColor,
        height: thickness.h,
        width: width,
      ),
    );
  }
}
