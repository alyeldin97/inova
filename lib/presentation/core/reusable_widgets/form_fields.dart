import 'package:Inova/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Inova/presentation/core/reusable_widgets/padding.dart';
import 'package:Inova/presentation/utils/colors.dart';

import '../../utils/textstyles.dart';
import '../../utils/validators.dart';

class AppFormField extends StatefulWidget {
  final String text;
  final String hintext;
  final double width;
  final int height;
  final bool hasTitle;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool enabled;
  final bool isPassword;
  bool isValid;
  final dynamic onChanged;
  final TextInputType keyboardType;
  final Widget prefix;
  final bool hintDisabled;
  final EdgeInsetsGeometry? contentPadding;
  final bool required;
  final bool hasShadow;
  final bool center;
  final bool isPhone;
  final bool isDatePicker;

  final TextStyle? textStyle;
  final Color? color;
  final Widget? icon;
  final Widget? suffixIcon;

  AppFormField({
    Key? key,
    required this.text,
    this.textStyle,
    this.hintext = '',
    required this.controller,
    this.isPassword = false,
    this.isPhone = false,
    this.height = 53,
    this.width = 335,
    this.hasTitle = false,
    this.validator = AppValidators.defaultValidator,
    this.enabled = true,
    this.onChanged,
    this.isValid = true,
    this.contentPadding,
    this.hintDisabled = false,
    this.keyboardType = TextInputType.text,
    this.prefix = const SizedBox(),
    this.suffixIcon,
    this.required = true,
    this.center = false,
    this.hasShadow = true,
    this.color,
    this.icon,
    this.isDatePicker = false,
  }) : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool isVisible;
  String? errorText;
  @override
  void initState() {
    isVisible = !widget.isPassword;
    widget.isValid = errorText == null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MarginDynamic(
      bottom: 5,
      child: Column(
        crossAxisAlignment: widget.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          widget.hasTitle
              ? PrimaryTextLight(text: widget.text, fontSize: 12)
              : Container(),
          const HeightBox(3),
          Stack(
            children: [
              widget.isValid
                  ? Container()
                  : Container(
                      child: Row(
                        children: [
                          const Spacer(),
                          PrimaryTextMedium(
                            top: 55,
                            text: errorText ?? widget.validator!("")!,
                            fontSize: 14,
                            color: AppColors.error,
                          ),
                          const WidthBox(10),
                        ],
                      ),
                    ),
              TextFormField(
                onTap: widget.isDatePicker
                    ? () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        widget.controller.text =
                            date.toString().substring(0, 10);
                      }
                    : null,
                style: widget.textStyle ??
                    primaryFontBoldTextStyle(12, color: AppColors.black),
                keyboardType: widget.keyboardType,
                onChanged: (value) {
                  setState(() {
                    errorText = widget.validator!(value);
                    widget.isValid = errorText == null;
                  });
                  // widget.onChanged(value);
                },
                obscureText: !isVisible,
                enabled: widget.enabled,
                controller: widget.controller,
                validator: widget.required ? widget.validator : null,
                decoration: InputDecoration(
                  isDense: false,
                  fillColor: widget.color,
                  filled: widget.color != null ? true : false,
                  prefixIcon: widget.icon,
                  suffixIcon: !widget.isPassword
                      ? widget.suffixIcon
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.black,
                          ),
                        ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:
                        const BorderSide(color: AppColors.secondaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:
                        const BorderSide(color: AppColors.secondaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:
                        const BorderSide(color: AppColors.secondaryColor),
                  ),
                  contentPadding: widget.contentPadding ??
                      EdgeInsetsDirectional.only(top: 30.h, start: 13.w),
                  hintText:
                      widget.hintext.isEmpty ? widget.text : widget.hintext,
                  hintStyle: primaryFontLightTextStyle(12,
                      color: AppColors.secondaryColor),
                  errorStyle:
                      const TextStyle(height: 0, color: Colors.transparent),
                  prefix: widget.prefix,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
