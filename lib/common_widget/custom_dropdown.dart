import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../project_setup.dart';

class CustomDropdown extends StatelessWidget {
  final double? width;
  final double? height;
  final List<dynamic> items;
  final ValueChanged<dynamic> onChanged;
  final dynamic value;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? itemStyle;
  final TextStyle? style;
  final IconData dropdownIcon;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? dropdownColor;
  final double? dropdownWidth;
  final double? dropdownHeight;
  final double? dropdownElevation;
  final double? dropdownBorderRadius;
  final double? dropdownMaxHeight;
  final Color? textColor;
  final Color? hintColor;
  final Color? itemColor;

  const CustomDropdown({
    super.key,
    this.width,
    this.height,
    required this.items,
    required this.onChanged,
    this.value,
    this.hint,
    this.hintStyle,
    this.itemStyle,
    this.style,
    this.dropdownIcon = Icons.arrow_drop_down,
    this.iconColor,
    this.iconSize,
    this.padding,
    this.margin,
    this.dropdownColor,
    this.dropdownWidth,
    this.dropdownHeight,
    this.dropdownElevation,
    this.dropdownBorderRadius,
    this.dropdownMaxHeight,
    this.textColor,
    this.hintColor,
    this.itemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<Map<String, dynamic>>(
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: dropdownColor ?? ColorResource.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(dropdownBorderRadius ?? 12)),
            ),
            padding: EdgeInsets.zero,
          ),
          value: value,
          iconStyleData: IconStyleData(
            icon: Icon(
              dropdownIcon,
              color: iconColor ?? Colors.black,
              size: iconSize ?? 25,
            ),
          ),
          hint: Text(
            hint ?? 'Choose Item',
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
          items: items.map((item) {
            return DropdownMenuItem<Map<String, dynamic>>(
              value: item,
              child: Text(
                '${item['name']}',
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 50.dp,
            width: 80.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(60)),
              border: Border.all(color: ColorResource.borderColor),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        ),
      ),
    );
  }
}