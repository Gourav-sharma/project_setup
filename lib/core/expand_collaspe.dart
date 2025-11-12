import '../project_setup.dart';

class CustomExpandCollapseWidget extends StatelessWidget {
  final Widget header;            // always visible (question)
  final Widget child;// collapsible content (answer)
  final bool? isExpanded;
  final VoidCallback? onToggle;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const CustomExpandCollapseWidget({
    super.key,
    required this.header,
    required this.child,
    this.isExpanded,
    this.onToggle,
    this.width,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final bool expanded = isExpanded ?? false;

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // header widget (question)
                Expanded(
                    child:header
                ),
              ],
            ),
          ),

          // spacing
          SizedBox(height: 8),

          // The answer part that toggles
          AnimatedCrossFade(
            firstChild: SizedBox.shrink(),
            secondChild: child,
            crossFadeState:
            expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
            firstCurve: Curves.easeOut,
            secondCurve: Curves.easeIn,
          ),
        ],
      ),
    );
  }
}
