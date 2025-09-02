import '../project_setup.dart';

class SideDrawer extends StatelessWidget {
  final Widget child;

  const SideDrawer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.sw,
      height:100.sh,
      color:ColorResource.appThemeColor,
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