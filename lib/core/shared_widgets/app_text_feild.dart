import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String?) validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final double? borderRadius;
  final int? maxLines;
  const AppTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText,
      this.focusedBorder,
      this.enabledBorder,
      this.contentPadding,
      required this.validator,
      this.controller,
      this.textInputType, this.prefixIcon, this.borderRadius, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: textInputType,
      controller: controller,
      decoration: decorationFromTextField(),
      obscureText: obscureText ?? false,
      validator: (value) {
        return validator(value);
      },
    );
  }

  InputDecoration decorationFromTextField() {
    return InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 17.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.0.sp),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide:  BorderSide(
                  color: ColorsManager.grey.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(borderRadius ??8.0.sp)),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintText: hintText,
        hintStyle: TextStyles.font14MediumLightBlack.copyWith(
            color: ColorsManager.mainBlack.withOpacity(0.2)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

       );
  }
}
