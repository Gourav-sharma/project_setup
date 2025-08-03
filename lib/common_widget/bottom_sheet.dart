import '../project_setup.dart';

class CustomBottomSheet {
  static void show({
    required BuildContext context,
    required Widget child,
    bool isDarkTheme = false,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: isDarkTheme ? ColorResource.blackColor : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}