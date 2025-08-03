import '../project_setup.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final VoidCallback? onTap;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize = 16.0,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}