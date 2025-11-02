import '../project_setup.dart';

class SideDrawer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final Color? backgroundColor ;

  const SideDrawer({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 85.sW,
      height:height ?? 100.sH,
      color:backgroundColor,
      child: Drawer(
        backgroundColor:Colors.transparent,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom),
          child: child,
        ),
      ),
    );
  }
}