import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_setup/project_setup.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
Future<void> main() async {
  await ApiRepository.storageInit();
  await ApiRepository.init(apiUrl: '',
      appHeaders: {});
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _projectSetupPlugin = ProjectSetup();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _projectSetupPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child:MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: CommonUtilMethods.manageTheme(false),
        darkTheme: CommonUtilMethods.manageTheme(true),
        themeMode: ThemeMode.light,
        home: BlocProvider(
            create: (BuildContext context) => FormPageBloc()..add(FormInitEvent(context: context)),
            child: BlocBuilder<FormPageBloc, FormPageState>(
              builder:(context, state) {
                final bloc = BlocProvider.of<FormPageBloc>(context);
                final state = bloc.state;
                return FormPage(
                  formKey: _formKey,
                  showAppBar: true,
                  backIcon: true,
                  bodyWidgets: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                            text: emailHint,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: ColorResource.lableColor
                        ),
                        SizedBox(height: 5),
                        CustomTextFormField(
                          focusNode: state.emailFocusNode,
                          hintText: "Email",
                          maxLines: 1,
                          onChanged: (value) {
                            bloc.add(EmailValidationEvent(value));
                          },
                          borderColor: Colors.grey,
                          prefixWidget: Padding(
                            padding:  EdgeInsets.only(right: 10, left: 10),
                            child: CustomSvgWidget(assetName: ImageResource.smsSvg),
                          ),
                          validator: (value) {
                            return (CommonUtilMethods
                                .isEmailValid(value!,message: emailValidationMessage2));
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                              text: passwordHint,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: ColorResource.lableColor
                          ),
                          SizedBox(height: 5.dp),
                          CustomTextFormField(
                            focusNode: state.passwordFocusNode,
                            hintText: "Password",
                            showPassword: state.isPassword,
                            isPassword: true,
                            keyBoardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              bloc.add(PasswordValidationEvent(value));
                            },
                            borderColor: Colors.grey,
                            prefixWidget: Padding(
                              padding:  EdgeInsets.only(right: 10, left: 10),
                              child: CustomSvgWidget(assetName: ImageResource.passwordSvg),
                            ),
                            suffixWidget: Padding(
                              padding:  EdgeInsets.only(right: 15, left: 10),
                              child: CustomSvgWidget(assetName: state.isPassword == false ? ImageResource.eyeOpenSvg : ImageResource.eyeCloseSvg),
                            ),
                            suffixTap: () {
                              bloc.add(OnPasswordTap(showPassword: state.isPassword == false ? true : false));
                            },
                            validator: (value) {
                              return (CommonUtilMethods
                                  .isPasswordValid(value!));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.dp,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextWidget(
                          text: forgotPassword,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: ColorResource.lableColor,
                          onTap: () {
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 40),
                      child: CustomButton(
                        text: loginButton,
                        width: MediaQuery.of(context).size.width,
                        elevation: 2,
                        height: 50,
                        onTap: () async {
                          CommonUtilMethods.closeKeyboard(context);
                          try{
                           ApiResponse response = await ApiRepository.apiCall('v1/Account/Login',
                              data: {
                                "email": state.email,
                                "password": state.password
                              },
                              RequestType.post,);
                            storage.write(SessionManagerKeys.authToken, response.data['data']['authorizationToken']);
                            storage.write(SessionManagerKeys.accessToken, response.data['data']['accessToken']);
                            AppLogs.showInfoLogs("authToken : ${storage.read(SessionManagerKeys.authToken)}");
                          }catch(e){
                            CommonUtilMethods.showSnackBar(context: context, message: e.toString());
                            AppLogs.showErrorLogs(e.toString());
                          }

                        },
                      ),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: dontHaveAccount,
                          style: TextStyle(
                            color: ColorResource.lableColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " $signUp",
                              style: TextStyle(
                                color: ColorResource.buttonColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
        )
       ,
      ),
    );
  }
}
