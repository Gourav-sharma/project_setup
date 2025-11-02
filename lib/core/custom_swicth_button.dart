import '../project_setup.dart';

class CustomSwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? activeText;
  final String? inactiveText;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool showLabel;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool isDisabled;

  const CustomSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeText,
    this.inactiveText,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.width,
    this.height,
    this.borderRadius,
    this.showLabel = true,
    this.margin,
    this.padding,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = value;
    return Container(
      margin: margin,
      padding: padding,
      width: width ?? 55.sP,
      height: height ?? 40.sP,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        color: isActive
            ? activeColor ?? Colors.greenAccent
            : inactiveColor ?? Colors.grey.shade400,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        onTap: isDisabled
            ? null
            : () {
          if (onChanged != null) onChanged!(!value);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Label text (optional)
            if (showLabel)
              Align(
                alignment: isActive
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    isActive
                        ? (activeText ?? 'On')
                        : (inactiveText ?? 'Off'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sP,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

            // Switch thumb
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment:
              isActive ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: (height ?? 30.sP) * 0.8,
                height: (height ?? 30.sP) * 0.8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: thumbColor ?? Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.2,
                        red: 0,
                        green: 0,
                        blue: 0,
                      ),
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
