import '../project_setup.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  final List<dynamic> menuItems;
  final Function(int) onItemClick;
  final VoidCallback? onCloseClick;

  const SideDrawer({
    super.key,
    required this.menuItems,
    required this.onItemClick,
    required this.onCloseClick,
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.dp,right: 15.dp),
                    child: IconButton(
                        onPressed: onCloseClick,
                        icon: Icon(Icons.close,color: ColorResource.whiteColor,)),
                  ),

                ],
              ),
              SizedBox(
                height: 80.sh,
                child: Wrap(
                  runSpacing: 15.sp,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    for(int index = 0; index < menuItems.length; index++)
                      Container(
                          width: 85.sw,
                          padding: EdgeInsets.only(left: 20.dp,right: 15.dp),
                          child: CustomTextWidget(
                            text: menuItems[index].title??"",
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            textColor: ColorResource.whiteColor,
                            onTap: () {
                              Navigator.of(context).pop();
                              onItemClick(index);
                            },
                          )
                      )
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}