import 'package:flutter/material.dart';

class CustomExpandCollapseWidget extends StatelessWidget {
  final Widget child;
  final bool? isExpanded;
  final VoidCallback? onToggle;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const CustomExpandCollapseWidget({
    super.key,
    required this.child,
    this.isExpanded,
    this.onToggle,
    this.width,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    bool expanded = isExpanded ?? false;
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Column(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Row(
              children: [
                Icon(
                  expanded
                      ? Icons.remove_circle
                      : Icons.add_circle,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  expanded ? "Collapse" : "Expand",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: child,
            crossFadeState:
            expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}