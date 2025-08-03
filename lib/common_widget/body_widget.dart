import '../project_setup.dart';

class CustomBodyWidget extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? child;
  final Widget? drawerWidget;
  final Widget? bottomBarWidget;
  final Widget? centerLogoWidget;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool? showAppBar;
  final bool? showBottomBar;
  final bool? menuIcon;
  final bool? backIcon;
  final bool? extendBodyBehindAppBar;
  final Widget? actionWidget;
  final Widget? backIconWidget;
  final Widget? menuIconWidget;
  final Widget? leadingWidget;
  final Color? iconColor;
  final Brightness? brightness;
  final dynamic appBarHeight;
  final Color? appBarColor;
  final Color? statusBarColor;
  final String? title;
  final VoidCallback? menuIconTap;
  final VoidCallback? backIconTap;
  final bool? loader;

  const CustomBodyWidget({
    super.key,
    this.scaffoldKey,
    this.child,
    this.drawerWidget,
    this.bottomBarWidget,
    this.centerLogoWidget,
    this.padding,
    this.backgroundColor,
    this.showAppBar=true,
    this.showBottomBar,
    this.menuIcon,
    this.backIcon,
    this.extendBodyBehindAppBar,
    this.actionWidget,
    this.backIconWidget,
    this.menuIconWidget,
    this.leadingWidget,
    this.iconColor,
    this.brightness,
    this.appBarHeight,
    this.appBarColor,
    this.statusBarColor,
    this.title,
    this.menuIconTap,
    this.backIconTap,
    this.loader,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: scaffoldKey,
          backgroundColor: backgroundColor??ColorResource.scaffoldColor,
          extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
          resizeToAvoidBottomInset: true,
          appBar: showAppBar == true
              ? AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: statusBarColor ?? ColorResource.statusBarColor,
              statusBarIconBrightness: brightness ?? Brightness.dark,
              statusBarBrightness: brightness ?? Brightness.dark,
            ),
            iconTheme: IconThemeData(color: iconColor ?? Colors.black),
            backgroundColor: appBarColor ?? Colors.transparent,
            title: centerLogoWidget ?? Text(
              title ?? "",
              style: TextStyle(color: ColorResource.whiteColor, fontSize: 16.sp),
            ),
            toolbarHeight: appBarHeight,
            centerTitle: true,
            leading:leadingWidget,
            // menuIcon == true
            //     ? GestureDetector(
            //      onTap: menuIconTap,
            //      child:menuIconWidget,
            // )
            //     : backIcon == true
            //         ? GestureDetector(
            //           onTap: backIconTap,
            //           child: backIconWidget,
            //        )
            //         : null,
            actions: actionWidget != null ? [
              actionWidget!,
            ]:null,
          )
              : null,
          body: SafeArea(child: child ?? Container()),
          bottomNavigationBar: showBottomBar == true
              ? bottomBarWidget ?? Container()
              : null,
          drawer: menuIcon == true ? drawerWidget : null,
        ),
        loader == true
            ? Container(
          width: 100.sw,
          height:  100.sh,
          color: ColorResource.blackColor.withAlpha(40),
          child: const Center(
            child: Center(
                child: LoadingBouncingGrid.square(
                  backgroundColor: ColorResource.appThemeColor,
                )),
          ),
        )
            : Container()
      ],
    );
  }
}