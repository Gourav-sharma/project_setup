import '../project_setup.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.fontSize,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorResource.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 60),
          ),
        ),
        elevation: elevation ?? 0.0,
        fixedSize: Size(width ?? 100, height ?? 40),
      ),
      child: CustomTextWidget(
        text: text,
        textColor: storage.read(SessionManagerKeys.isDarkMode) == true ?
        ColorResource.blackColor: textColor ?? ColorResource.whiteColor,
        fontSize: fontSize ?? 15.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}