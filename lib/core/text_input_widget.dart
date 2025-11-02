import '../project_setup.dart';

/// ✅ Base Common Input
class CustomInputField extends StatelessWidget {
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
  final Color? fillColor;
  final bool? filled;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final VoidCallback? suffixTap;
  final TextInputType keyBoardType;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomInputField({
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
    this.fillColor,
    this.filled,
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
          fillColor: fillColor,
          filled: filled,
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
class CustomInputWithIcon extends CustomInputField {
  const CustomInputWithIcon({
    super.key,
    super.controller,
    required Widget icon,
    String? hint,
    String? label,
    super.focusNode,
    super.borderColor = null,
    super.onChanged,
    super.validator,
  }) : super(
    prefixWidget: icon,
    hintText: hint,
    labelText: label,
  );
}

/// Input without Icon
class CustomInputWithoutIcon extends CustomInputField {
  const CustomInputWithoutIcon({
    super.key,
    super.controller,
    String? hint,
    String? label,
    super.focusNode,
    super.borderColor = null,
    super.onChanged,
    super.validator,
  }) : super(
    hintText: hint,
    labelText: label,
  );
}


/// Email Field
/// Email Field
class CustomEmailInputText extends CustomInputField {
  const CustomEmailInputText({
    super.key,
    super.controller,
    super.readOnly,
    String? hint = "Enter email",
    super.focusNode,
    super.borderColor = null,
    Widget? prefixIcon, // ✅ new optional param
    super.onChanged,
    super.validator,
  }) : super(
    hintText: hint,
    keyBoardType: TextInputType.emailAddress,
    prefixWidget: prefixIcon ?? const Icon(Icons.email_outlined),
  );
}



/// Password Field
class CustomPasswordInputText extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Widget? prefixIcon; // ✅ optional
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomPasswordInputText({
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
  State<CustomPasswordInputText> createState() => _CustomPasswordInputTextState();
}

class _CustomPasswordInputTextState extends State<CustomPasswordInputText> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
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
class CustomPhoneInputText extends CustomInputField {
  const CustomPhoneInputText({
    super.key,
    super.controller,
    super.readOnly,
    String? hint = "Enter phone number",
    super.focusNode,
    super.borderColor = null,
    Widget? prefixIcon, // ✅ optional
    super.onChanged,
    super.validator,
  }) : super(
    hintText: hint,
    keyBoardType: TextInputType.phone,
    prefixWidget: prefixIcon ?? const Icon(Icons.phone),
  );
}

/// Multiline Input (e.g., About Us)
class CustomMultilineInputText extends CustomInputField {
  const CustomMultilineInputText({
    super.key,
    super.controller,
    super.readOnly,
    String? hint,
    super.focusNode,
    super.borderColor = null,
    Widget? prefixIcon, // ✅ optional
    double super.height = 120,
    super.onChanged,
    super.validator,
  }) : super(
    hintText: hint,
    maxLines: 5,
    keyBoardType: TextInputType.multiline,
    prefixWidget: prefixIcon,
  );
}

