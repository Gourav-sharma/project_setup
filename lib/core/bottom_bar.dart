import '../project_setup.dart';

class CustomBottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onBottomTapped;
  final bool showLabel;

  const CustomBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onBottomTapped,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      selectedItemColor: ColorResource.whiteColor,
      unselectedItemColor: ColorResource.blackColor.withValues(alpha: 0.5),
      selectedFontSize: showLabel ? 15.sp : 0,
      unselectedFontSize: showLabel ? 15.sp : 0,
      showSelectedLabels: showLabel,
      showUnselectedLabels: showLabel,
      backgroundColor: ColorResource.appThemeColor,
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
