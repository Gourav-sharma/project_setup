import '../project_setup.dart';

class CustomBottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onBottomTapped;
  final bool showLabel;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? elevation;

  const CustomBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onBottomTapped,
    this.showLabel = true,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.fontSize,
    this.height,
    this.width,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width?? double.infinity,
      height: height ,
      child: BottomNavigationBar(
        elevation: elevation ?? 0,
        items: items
            .map(
              (item) => BottomNavigationBarItem(
            icon: item.iconWidget ?? const SizedBox.shrink(),
            activeIcon: item.activeIconWidget ?? item.iconWidget ?? const SizedBox.shrink(),
            label: item.label ?? "",
            tooltip: item.tooltip,
          ),
        )
            .toList(),
        currentIndex: currentIndex,
        onTap: onBottomTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedItemColor ?? Colors.white,
        unselectedItemColor: unselectedItemColor ?? Colors.grey,
        selectedFontSize: showLabel ? fontSize ?? 15.sp : 0,
        unselectedFontSize: showLabel ? fontSize ?? 15.sp : 0,
        showSelectedLabels: showLabel,
        showUnselectedLabels: showLabel,
        backgroundColor: backgroundColor ?? Colors.transparent,
      ),
    );
  }
}

/// More flexible BottomBarItem
class BottomBarItem {
  final String? label; // optional text
  final Widget? iconWidget; // default icon
  final Widget? activeIconWidget; // optional active icon
  final String? tooltip; // optional tooltip

  const BottomBarItem({
    this.label,
    this.iconWidget,
    this.activeIconWidget,
    this.tooltip,
  });
}
