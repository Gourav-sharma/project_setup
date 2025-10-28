import '../project_setup.dart';

/// Base Custom Text Widget
class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final TextDecoration? decoration;
  final String? fontFamily;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize = 16.0,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.onTap,
    this.decoration,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.normal,
          decoration: decoration,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}

/// 1. Text with Row (label + value)
class CustomRowTextWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color? labelColor;
  final Color? valueColor;
  final double fontSize;
  final FontWeight? labelWeight;
  final FontWeight? valueWeight;
  final String? fontFamily;

  const CustomRowTextWidget({
    super.key,
    required this.label,
    required this.value,
    this.labelColor,
    this.valueColor,
    this.fontSize = 16.0,
    this.labelWeight,
    this.valueWeight,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: label,
          textColor: labelColor,
          fontWeight: labelWeight ?? FontWeight.bold,
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomTextWidget(
            text: value,
            textColor: valueColor ?? Colors.grey,
            fontWeight: valueWeight ?? FontWeight.normal,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        ),
      ],
    );
  }
}

/// 2. Underline Text
class CustomUnderlineTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;

  const CustomUnderlineTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize = 16.0,
    this.fontWeight,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      text: text,
      textColor: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      decoration: TextDecoration.underline,
    );
  }
}

/// 3. Read More Text
class CustomReadMoreTextWidget extends StatefulWidget {
  final String text;
  final int trimLines;
  final Color? textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;

  const CustomReadMoreTextWidget({
    super.key,
    required this.text,
    this.trimLines = 2,
    this.textColor,
    this.fontSize = 16.0,
    this.fontWeight,
    this.fontFamily,
  });

  @override
  State<CustomReadMoreTextWidget> createState() => _CustomReadMoreTextWidgetState();
}

class _CustomReadMoreTextWidgetState extends State<CustomReadMoreTextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: widget.textColor ?? Colors.black,
      fontSize: widget.fontSize,
      fontWeight: widget.fontWeight ?? FontWeight.normal,
      fontFamily: widget.fontFamily,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : widget.trimLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: textStyle,
        ),
        InkWell(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              isExpanded ? "Read less" : "Read more",
              style: textStyle.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
