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
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blueAccent,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 60),
            ),
            side: showBorder
                ? BorderSide(color: borderColor ?? Colors.blueAccent)
                : BorderSide.none,
          ),
          elevation: elevation ?? 0.0,
          //fixedSize: Size(width ?? 100, height ?? 40),
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: textColor ?? Colors.white,
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
              textColor: textColor ?? Colors.white,
              fontSize: fontSize ?? 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

/// Button with Icon
class CustomIconButton extends CustomButton {
  CustomIconButton({
    super.key,
    required super.text,
    required IconData icon,
    super.onTap,
    super.backgroundColor,
    super.textColor,
    super.width,
    super.height,
    super.borderRadius,
    super.showBorder,
  }) : super(
    leading: Icon(icon, color: textColor ?? Colors.white, size: 18),
  );
}

/// Loader Button
class CustomLoaderButton extends CustomButton {
  CustomLoaderButton({
    super.key,
    required super.text,
    required super.isLoading,
    super.onTap,
    super.backgroundColor,
    super.textColor,
    super.width,
    super.height,
    super.fontSize,
    super.borderRadius,
    super.elevation,
    super.margin,
    super.padding,
  }) : super(
    leading: isLoading
        ? SizedBox(
      height: 18,
      width: 18,
      child: CircularProgressIndicator(
        color: textColor ?? Colors.white,
        strokeWidth: 2,
      ),
    )
        : null,
  );
}

/// Button with Border (Outline Style)
class CustomOutlinedButton extends CustomButton {
  const CustomOutlinedButton({
    super.key,
    required super.text,
    super.onTap,
    Color? textColor,
    Color? borderColor,
    super.width,
    super.height,
    super.borderRadius,
  }) : super(
    textColor: textColor ?? Colors.blueAccent,
    backgroundColor: Colors.transparent,
    borderColor: borderColor ?? Colors.blueAccent,
    showBorder: true,
  );
}
