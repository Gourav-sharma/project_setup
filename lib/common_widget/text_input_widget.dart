import '../project_setup.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final bool? showPassword;
  final bool? isSuffixShow;
  final double? borderRadius;
  final double? height;
  final int? maxLines;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? initialValue;
  final String? helperText;
  final Color? borderColor;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final VoidCallback? suffixTap;
  final TextInputType keyBoardType;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.isPassword,
    this.showPassword,
    this.isSuffixShow,
    this.borderRadius,
    this.height,
    this.maxLines,
    this.isReadOnly,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.errorText,
    this.initialValue,
    this.helperText,
    this.borderColor,
    this.prefixWidget,
    this.suffixWidget,
    this.suffixTap,
    this.keyBoardType = TextInputType.text,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        focusNode:focusNode,
        autofocus: false,
        initialValue: initialValue,
        obscureText: showPassword ?? false,
        onChanged: onChanged,
        validator: validator,
        readOnly: isReadOnly ?? false,
        textAlign: TextAlign.start,
        maxLines: maxLines??1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType:keyBoardType,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          helperText: helperText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??60.0),// Customize when disabled
            borderSide: BorderSide(color: borderColor?? ColorResource.borderColor), // Example color
          ), // Or UnderlineInputBorder()
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??60.0),// Customize when enabled
            borderSide: BorderSide(color:borderColor?? ColorResource.borderColor), // Example color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??60.0),// Customize when focused
            borderSide: BorderSide(color:borderColor?? ColorResource.greyColor), // Example color
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??60.0),// Customize when error
            borderSide: BorderSide(color: ColorResource.appThemeColor), // Example color
          ),
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget!=null?
              GestureDetector(
                onTap: suffixTap,
                child: suffixWidget,
              )
              :null,
          errorMaxLines: 5
        ),
      ),
    );
  }
}