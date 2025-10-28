import '../project_setup.dart';


class AppDimensions {
  /// Initializes the screen dimensions for responsive design.
  static void init(BuildContext context) {
    // Initializes ScreenUtil with the context to get screen size info
    ScreenUtil.init(
      context,
      designSize: Size(360, 690), // Set the design size here (typically your design mockup size)
      minTextAdapt: true, // Optional: Adjusts the text size scaling
      splitScreenMode: true, // Optional: Enables split screen support
    );
  }
}

/// Extension methods for [num] to provide easy access to dp, sp, sw, and sh.
extension DimensionsExtension on num {
  /// Converts dp (density-independent pixels) to pixels.
  ///
  /// Example: `16.dp`
  double get dP => ScreenUtil().setWidth(toDouble());

  /// Converts sp (scale-independent pixels) to pixels.
  ///
  /// Example: `16.sp`
  double get sP => ScreenUtil().setSp(toDouble());

  /// Calculates a percentage of the screen width.
  ///
  /// Example: `50.sw` (50% of screen width)
  double get sW => ScreenUtil().screenWidth * (this / 100);

  /// Calculates a percentage of the screen height.
  ///
  /// Example: `30.sh` (30% of screen height)
  double get sH => ScreenUtil().screenHeight * (this / 100);
}