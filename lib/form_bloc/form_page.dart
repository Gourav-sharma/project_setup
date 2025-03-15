
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../project_setup.dart';



class FormPage extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  final bool? loader;
  final bool? showAppBar;
  final bool? backIcon;
  final dynamic appBarHeight;
  final Widget? logoImage;
  final Widget? backIconWidget;
  final List<Widget>? bodyWidgets;
  final double? height;
  final double? width;
  final EdgeInsets? padding;


  const FormPage({
    super.key,
    required this.formKey ,
    this.loader,
    this.showAppBar,
    this.backIcon,
    this.appBarHeight,
    this.height,
    this.width,
    this.logoImage,
    this.backIconWidget,
    this.bodyWidgets,
    this.padding,
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
        loader: loader,
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
