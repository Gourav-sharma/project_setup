import '../project_setup.dart';

class CustomBodyWidget extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? child;
  final Widget? drawerWidget;
  final Widget? bottomBarWidget;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  // AppBar
  final bool showAppBar;
  final String? title;
  final Widget? titleWidget;
  final Widget? actionWidget;
  final bool centerTitle;
  final bool showBottomBar;
  final bool showMenuIcon;
  final bool showBackIcon;
  final Color? iconColor;
  final Brightness? brightness;
  final double? appBarHeight;
  final Color? appBarColor;
  final Color? statusBarColor;
  final String? fontFamily;
  final VoidCallback? menuIconTap;
  final VoidCallback? backIconTap;
  final Widget? menuIconWidget; // 👈 user provided menu icon
  final Widget? backIconWidget;

  // Overlay
  final bool showLoader;
  final Widget? loaderWidget;

  // Extra
  final bool bottomShadow;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final Color? systemNavigationBarColor;
  final Color? systemNavigationBarDividerColor;
  final Widget? userImageWidget;
  final EdgeInsetsGeometry? userImageWidgetPadding;
  final Widget? bottomChildWidget;

  const CustomBodyWidget({
    super.key,
    this.scaffoldKey,
    this.child,
    this.drawerWidget,
    this.bottomBarWidget,
    this.padding,
    this.backgroundColor,
    this.showAppBar = false,
    this.title,
    this.titleWidget,
    this.actionWidget,
    this.centerTitle = true,
    this.showBottomBar = false,
    this.showMenuIcon = false,
    this.showBackIcon = false,
    this.iconColor,
    this.brightness,
    this.appBarHeight,
    this.appBarColor,
    this.statusBarColor,
    this.fontFamily,
    this.menuIconTap,
    this.backIconTap,
    this.menuIconWidget,
    this.backIconWidget,
    this.showLoader = false,
    this.loaderWidget,
    this.bottomShadow = true,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.systemNavigationBarColor,
    this.systemNavigationBarDividerColor,
    this.userImageWidget,
    this.userImageWidgetPadding,
    this.bottomChildWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor ?? Colors.white,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: showAppBar
          ? AppBar(
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: statusBarColor ?? Colors.white,
          statusBarIconBrightness: brightness ?? Brightness.dark,
          statusBarBrightness: brightness ?? Brightness.light,
          systemNavigationBarColor:
          systemNavigationBarColor ?? Colors.white,
          systemNavigationBarDividerColor:
          systemNavigationBarDividerColor ?? Colors.white,
          systemNavigationBarIconBrightness:
          brightness ?? Brightness.dark,
        ),
        iconTheme: IconThemeData(color: iconColor ?? Colors.black),
        backgroundColor: appBarColor ?? Colors.white,
        titleSpacing: 0,
        title: titleWidget ??
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: iconColor ?? Colors.black,
              ),
            ),
        toolbarHeight: appBarHeight,
        centerTitle: centerTitle,
        elevation: bottomShadow ? 4 : 0,
        leading: showMenuIcon
            ? IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: menuIconWidget ??
              const Icon(Icons.menu), // 👈 fallback if not given
          onPressed: menuIconTap,
        )
            : showBackIcon
            ? IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: backIconWidget ??
              Icon(Icons.arrow_back,
                  color: iconColor ?? Colors.black), // 👈 fallback
          onPressed: backIconTap,
        )
            : null,
        actions: [
          if (actionWidget != null) actionWidget!,
        ],
      )
          : null,
      body: Stack(
        children: [
          if (userImageWidget != null)
            SingleChildScrollView(
              padding: userImageWidgetPadding,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: userImageWidget!,
              ),
            ),
          SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
                  child: child ?? Container(),
                ),
                if (showBottomBar && bottomBarWidget != null)
                  Positioned(
                    bottom: 0,
                    left: 16,
                    right: 16,
                    child: bottomBarWidget!,
                  ),
              ],
            ),
          ),
          bottomChildWidget ?? Container(),
        ],
      ),
      drawer: showMenuIcon ? drawerWidget : null,
    );
  }
}
