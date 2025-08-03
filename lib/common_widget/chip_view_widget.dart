import '../project_setup.dart';

class CustomChipWidget extends StatelessWidget {
  final Axis direction;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final List<Widget> children;

  const CustomChipWidget({
    super.key,
    required this.children,
    this.direction = Axis.horizontal,
    this.spacing = 8.0,
    this.runSpacing = 4.0,
    this.alignment = WrapAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction,
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      children: children,
    );
  }
}