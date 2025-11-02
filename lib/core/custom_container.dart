import '../project_setup.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Widget? child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? borderColor;

  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.onTap,
    this.child,
    this.color,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: borderColor == null ? null : Border.all(color: borderColor?? Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 0),
          ),
        ),
        padding: padding,
        margin: margin,
        child: child,
      ),
    );
  }
}