import '../project_setup.dart';
import 'package:flutter/material.dart';


class LogoutDialog extends StatelessWidget {
  final VoidCallback? onLogout;

  const LogoutDialog({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.brightness == Brightness.dark ? Colors.grey[800] :
      Colors.grey[200]?.withValues(alpha: 0.70),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 15.0,
      contentPadding:EdgeInsets.zero,
      alignment: Alignment.center,
      titlePadding: EdgeInsets.only(top: 25, left: 15, right: 15),
      titleTextStyle: TextStyle(
        color: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      title: Center(
        child: CustomTextWidget(
         text:  'Log Out',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            textColor: ColorResource.blackColor,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20, left: 25, right: 25,bottom: 10),
            child: CustomTextWidget(
             text:  'Are you sure you want to logout?',
              fontSize: 18.sp,
              maxLines: 2,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              textColor: ColorResource.blackColor,
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            color:ColorResource.greyColor.withValues(alpha: 0.3),
            height: 0.2,
          ),

          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin:  EdgeInsets.only(top: 10,bottom: 12),
                  child: CustomTextWidget(
                    textAlign: TextAlign.center,
                    text: "Cancel",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    textColor: ColorResource.primaryColor,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                VerticalDivider(
                  color:ColorResource.greyColor.withValues(alpha: 0.3),
                  width: 0.2,
                ),

                Container(
                  margin:  EdgeInsets.only(top: 10,bottom: 12),
                  child: CustomTextWidget(
                    textAlign: TextAlign.center,
                    text: 'Sign Out',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    textColor: ColorResource.primaryColor,
                    onTap: onLogout,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsPadding:  EdgeInsets.zero,
      actions: [

      ],
    );
  }

  // Static method to show the dialog
  static void show(BuildContext context,
      String backRoute, {VoidCallback? onLogout}) {
    showDialog(
      context: context,
      barrierColor:Colors.black.withValues(alpha: 0.75),
      builder: (BuildContext context) {
        return LogoutDialog(
          onLogout: onLogout,
        ); // Now const since no parameters
      },
    );
  }
}