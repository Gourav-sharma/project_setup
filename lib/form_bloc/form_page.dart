
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../project_setup.dart';



class FormPage extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  final Color? appBarColor;
  final bool? loader;
  final bool? showAppBar;
  final bool? backIcon;
  final bool? menuIcon;
  final dynamic appBarHeight;
  final Widget? logoImage;
  final Widget? backIconWidget;
  final Widget? emailInputWidget;
  final Widget? passwordInputWidget;
  final Widget? confirmPasswordInputWidget;
  final Widget? newPasswordInputWidget;
  final Widget? firstNameInputWidget;
  final Widget? lastNameInputWidget;
  final Widget? phoneNumberInputWidget;
  final Widget? forgotPasswordTextWidget;
  final Widget? submitButtonWidget;
  final Widget? dontHaveAccountTextWidget;
  final Widget? haveAccountTextWidget;
  final List<Widget>? bodyWidgets;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final VoidCallback? backIconTap;


  const FormPage({
    super.key,
    required this.formKey,
    this.appBarColor,
    this.loader,
    this.showAppBar,
    this.backIcon,
    this.menuIcon,
    this.appBarHeight,
    this.height,
    this.width,
    this.logoImage,
    this.backIconWidget,
    this.emailInputWidget,
    this.passwordInputWidget,
    this.confirmPasswordInputWidget,
    this.newPasswordInputWidget,
    this.firstNameInputWidget,
    this.lastNameInputWidget,
    this.phoneNumberInputWidget,
    this.forgotPasswordTextWidget,
    this.submitButtonWidget,
    this.dontHaveAccountTextWidget,
    this.haveAccountTextWidget,
    this.bodyWidgets,
    this.padding,
    this.backIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FormPageBloc()..add(FormInitEvent(context: context)),
        child: BlocBuilder<FormPageBloc, FormPageState>(
            builder: (context, state) => _buildPage(context, state),
        )
    );

  }

  Widget _buildPage(BuildContext context, FormPageState state) {
    return CustomBodyWidget(
        showAppBar: showAppBar,
        appBarHeight: appBarHeight,
        appBarColor: appBarColor,
        loader: loader,
        leadingWidget: backIcon == true ? GestureDetector(
          onTap: backIconTap,
          child: backIconWidget,
        ) : null,
        child: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
                child: Padding(
                    padding: padding ?? EdgeInsets.only(left: 20.dp, right: 20.dp, top: 20.dp, bottom:MediaQuery.of(context).viewInsets.bottom+30.dp),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            key: formKey,
                            child: BlocBuilder<FormPageBloc, FormPageState>(
                              builder: (context, state) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10.dp,
                                    ),
                                    logoImage ??Container(),
                                    emailInputWidget ??Container(),
                                    passwordInputWidget ??Container(),
                                    confirmPasswordInputWidget ??Container(),
                                    newPasswordInputWidget ??Container(),
                                    firstNameInputWidget ??Container(),
                                    lastNameInputWidget ??Container(),
                                    phoneNumberInputWidget ??Container(),
                                    forgotPasswordTextWidget ??Container(),
                                    submitButtonWidget ??Container(),
                                    dontHaveAccountTextWidget ??Container(),
                                    haveAccountTextWidget ??Container(),
                                    bodyWidgets != null ? Wrap(
                                      children: [
                                        for (Widget widget in bodyWidgets!)
                                          widget
                                      ],
                                    ):Container(),
                                  ],
                                );
                              }
                          )
                          )
                        ],
                    ),
                ))));
  }
}
