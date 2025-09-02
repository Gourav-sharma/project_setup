import '../project_setup.dart';

/// ✅ Base Common Button
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
  final Widget? leading; // ✅ icon/loader etc.
  final bool showBorder; // ✅ border toggle
  final Color? borderColor;
  final bool isLoading; // ✅ loader toggle

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
    this.leading,
    this.showBorder = false,
    this.borderColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorResource.buttonColor,
          foregroundColor: textColor ?? ColorResource.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 60),
            ),
            side: showBorder
                ? BorderSide(color: borderColor ?? ColorResource.buttonColor)
                : BorderSide.none,
          ),
          elevation: elevation ?? 0.0,
          fixedSize: Size(width ?? 100, height ?? 40),
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: textColor ?? ColorResource.whiteColor,
            strokeWidth: 2,
          ),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 8),
            ],
            CustomTextWidget(
              text: text,
              textColor: textColor ?? ColorResource.whiteColor,
              fontSize: fontSize ?? 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

//
// ✅ Specialized Buttons
//

/// Button with Icon
class IconButtonWidget extends CustomButton {
  IconButtonWidget({
    super.key,
    required String text,
    required IconData icon,
    VoidCallback? onTap,
    Color? backgroundColor,
    Color? textColor,
    double? width,
    double? height,
    double? borderRadius,
    bool showBorder = false,
  }) : super(
    text: text,
    onTap: onTap,
    backgroundColor: backgroundColor,
    textColor: textColor,
    width: width,
    height: height,
    borderRadius: borderRadius,
    showBorder: showBorder,
    leading: Icon(icon, color: textColor ?? ColorResource.whiteColor, size: 18),
  );
}

/// Loader Button
class LoaderButton extends CustomButton {
  LoaderButton({
    super.key,
    required String text,
    required bool isLoading,
    VoidCallback? onTap,
    Color? backgroundColor,
    Color? textColor,
    double? width,
    double? height,
    double? fontSize,
    double? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) : super(
    text: text,
    onTap: onTap,
    backgroundColor: backgroundColor,
    textColor: textColor,
    width: width,
    height: height,
    fontSize: fontSize,
    borderRadius: borderRadius,
    elevation: elevation,
    margin: margin,
    padding: padding,
    isLoading: isLoading, // 🔑 use base class loader toggle
    // show loader **beside** text
    leading: isLoading
        ? SizedBox(
      height: 18,
      width: 18,
      child: CircularProgressIndicator(
        color: textColor ?? ColorResource.whiteColor,
        strokeWidth: 2,
      ),
    )
        : null,
  );
}


/// Button with Border (Outline Style)
class OutlinedButtonWidget extends CustomButton {
  OutlinedButtonWidget({
    super.key,
    required String text,
    VoidCallback? onTap,
    Color? textColor,
    Color? borderColor,
    double? width,
    double? height,
    double? borderRadius,
  }) : super(
    text: text,
    onTap: onTap,
    textColor: textColor ?? ColorResource.buttonColor,
    backgroundColor: Colors.transparent,
    borderColor: borderColor ?? ColorResource.buttonColor,
    showBorder: true,
    width: width,
    height: height,
    borderRadius: borderRadius,
  );
}
