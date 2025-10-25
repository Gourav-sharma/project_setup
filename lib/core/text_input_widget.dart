import '../project_setup.dart';

/// ✅ Base Common Input
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final double borderRadius;
  final double? height;
  final int maxLines;
  final bool readOnly;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? initialValue;
  final String? helperText;
  final Color? borderColor;
  final Color? errorBorderColor;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final VoidCallback? suffixTap;
  final TextInputType keyBoardType;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.borderRadius = 12.0,
    this.height,
    this.maxLines = 1,
    this.readOnly = false,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.errorText,
    this.initialValue,
    this.helperText,
    this.borderColor = Colors.grey,
    this.errorBorderColor = Colors.red ,
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
        focusNode: focusNode,
        autofocus: false,
        initialValue: initialValue,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        readOnly: readOnly,
        textAlign: TextAlign.start,
        maxLines: maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          helperText: helperText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor  ?? Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor ?? Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor ?? Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide:  BorderSide(color: errorBorderColor ?? Colors.red),
          ),
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget != null
              ? GestureDetector(onTap: suffixTap, child: suffixWidget)
              : null,
          errorMaxLines: 5,
        ),
      ),
    );
  }
}

//
// ✅ Specialized Inputs
//

/// Input with Icon
class InputTextWithIcon extends CustomTextFormField {
  InputTextWithIcon({
    super.key,
    TextEditingController? controller,
    required Widget icon,
    String? hint,
    String? label,
    FocusNode? focusNode,
    Color? borderColor,
    Function(String)? onChanged,
    FormFieldValidator<String>? validator,
  }) : super(
    controller: controller,
    prefixWidget: icon,
    hintText: hint,
    labelText: label,
    focusNode: focusNode,
    borderColor: borderColor,
    onChanged: onChanged,
    validator: validator,
  );
}

/// Input without Icon
class InputTextWithoutIcon extends CustomTextFormField {
  InputTextWithoutIcon({
    super.key,
    TextEditingController? controller,
    String? hint,
    String? label,
    FocusNode? focusNode,
    Color? borderColor,
    Function(String)? onChanged,
    FormFieldValidator<String>? validator,
  }) : super(
    controller: controller,
    hintText: hint,
    labelText: label,
    focusNode: focusNode,
    borderColor: borderColor,
    onChanged: onChanged,
    validator: validator,
  );
}


/// Email Field
/// Email Field
class EmailInputText extends CustomTextFormField {
  EmailInputText({
    super.key,
    TextEditingController? controller,
    String? hint = "Enter email",
    FocusNode? focusNode,
    Color? borderColor,
    Widget? prefixIcon, // ✅ new optional param
    Function(String)? onChanged,
    FormFieldValidator<String>? validator,
  }) : super(
    controller: controller,
    hintText: hint,
    focusNode: focusNode,
    borderColor: borderColor,
    keyBoardType: TextInputType.emailAddress,
    prefixWidget: prefixIcon ?? const Icon(Icons.email_outlined), // ✅ fallback
    onChanged: onChanged,
    validator: validator,
  );
}



/// Password Field
class PasswordInputText extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Widget? prefixIcon; // ✅ optional
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const PasswordInputText({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.focusNode,
    this.borderColor,
    this.prefixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  State<PasswordInputText> createState() => _PasswordInputTextState();
}

class _PasswordInputTextState extends State<PasswordInputText> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: widget.hint,
      labelText: widget.label,
      focusNode: widget.focusNode,
      borderColor: widget.borderColor,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: _obscure,
      prefixWidget: widget.prefixIcon ?? const Icon(Icons.lock_outline), // ✅ default
      suffixWidget: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
      suffixTap: () => setState(() => _obscure = !_obscure),
    );
  }
}

/// Phone Field
class PhoneInputText extends CustomTextFormField {
  PhoneInputText({
    super.key,
    TextEditingController? controller,
    String? hint = "Enter phone number",
    FocusNode? focusNode,
    Color? borderColor,
    Widget? prefixIcon, // ✅ optional
    Function(String)? onChanged,
    FormFieldValidator<String>? validator,
  }) : super(
    controller: controller,
    hintText: hint,
    focusNode: focusNode,
    borderColor: borderColor,
    keyBoardType: TextInputType.phone,
    prefixWidget: prefixIcon ?? const Icon(Icons.phone), // ✅ default
    onChanged: onChanged,
    validator: validator,
  );
}

/// Multiline Input (e.g., About Us)
class MultilineInputText extends CustomTextFormField {
  MultilineInputText({
    super.key,
    TextEditingController? controller,
    String? hint,
    FocusNode? focusNode,
    Color? borderColor,
    Widget? prefixIcon, // ✅ optional
    double height = 120,
    Function(String)? onChanged,
    FormFieldValidator<String>? validator,
  }) : super(
    controller: controller,
    hintText: hint,
    height: height,
    maxLines: 5,
    focusNode: focusNode,
    borderColor: borderColor,
    keyBoardType: TextInputType.multiline,
    prefixWidget: prefixIcon, // ✅ optional, no default here
    onChanged: onChanged,
    validator: validator,
  );
}

