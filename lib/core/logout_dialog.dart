import '../project_setup.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback? onLogout;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? contentColor;
  final Color? cancelColor;
  final Color? confirmColor;
  final Color? borderColor;
  final String? title;
  final String? content;
  final String? cancelText;
  final String? confirmText;
  final dynamic titleFontSize;
  final dynamic contentFontSize;
  final dynamic cancelFontSize;
  final dynamic confirmFontSize;


  const LogoutDialog({
    super.key,
    this.backgroundColor,
    this.onLogout,
    this.titleColor,
    this.contentColor,
    this.cancelColor,
    this.confirmColor,
    this.borderColor = Colors.grey,
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.titleFontSize,
    this.contentFontSize,
    this.cancelFontSize,
    this.confirmFontSize,
    });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: backgroundColor ?? Colors.white.withValues(alpha: 1.3),
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
         text: title ?? 'Log Out',
            fontSize: titleFontSize ?? 18.sp,
            fontWeight: FontWeight.w500,
            textColor: titleColor ?? Colors.black,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 10, left: 25, right: 25,bottom: 20),
            child: CustomTextWidget(
             text: content ?? 'Are you sure you want to logout?',
              fontSize: contentFontSize ?? 18.sp,
              maxLines: 2,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              textColor: contentColor ?? Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            color:borderColor?? Colors.grey.withValues(alpha: 0.3),
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
                    text: cancelText ?? "Cancel",
                    fontSize: cancelFontSize ?? 16.sp,
                    fontWeight: FontWeight.w400,
                    textColor: cancelColor ?? Colors.blueAccent,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                VerticalDivider(
                  color:borderColor?? Colors.grey.withValues(alpha: 0.3),
                  width: 0.2,
                ),

                Container(
                  margin:  EdgeInsets.only(top: 10,bottom: 12),
                  child: CustomTextWidget(
                    textAlign: TextAlign.center,
                    text: confirmText ?? 'Sign Out',
                    fontSize: confirmFontSize ?? 16.sp,
                    fontWeight: FontWeight.w400,
                    textColor: confirmColor ?? Colors.blueAccent,
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
        {VoidCallback? onLogout,
        Color? backgroundColor,Color? titleColor,
         Color? contentColor,
         Color? cancelColor,
         Color? confirmColor,
         String? title,
         String? content,
         String? cancelText,
         String? confirmText,
         dynamic titleFontSize,
         dynamic contentFontSize,
         dynamic cancelFontSize,
         dynamic confirmFontSize
     }) {
    showDialog(
      context: context,
      barrierColor:Colors.black.withValues(alpha: 0.75),
      builder: (BuildContext context) {
        return LogoutDialog(
          onLogout: onLogout,
          backgroundColor: backgroundColor,
          titleColor: titleColor,
          contentColor: contentColor,
          cancelColor: cancelColor,
          confirmColor: confirmColor,
          title: title,
          content: content,
          cancelText: cancelText,
          confirmText: confirmText,
          titleFontSize: titleFontSize,
          contentFontSize: contentFontSize,
          cancelFontSize: cancelFontSize,
          confirmFontSize: confirmFontSize,
        ); // Now const since no parameters
      },
    );
  }
}

