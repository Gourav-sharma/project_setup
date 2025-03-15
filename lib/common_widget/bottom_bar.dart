import '../project_setup.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onBottomTapped;

  const CustomBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onBottomTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ))
          .toList(),
      currentIndex: currentIndex,
      onTap: onBottomTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorResource.whiteColor,
      unselectedItemColor: ColorResource.blackColor.withValues(alpha:0.5),
      selectedFontSize: 15.sp,
      unselectedFontSize: 15.sp,
      backgroundColor: ColorResource.appThemeColor,
    );
  }
}

class BottomBarItem {
  final IconData icon;
  final String label;

  const BottomBarItem({
    required this.icon,
    required this.label,
  });
}