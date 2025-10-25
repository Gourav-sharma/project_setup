import '../project_setup.dart';

class SideDrawer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor ;

  const SideDrawer({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.sw,
      height:100.sh,
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