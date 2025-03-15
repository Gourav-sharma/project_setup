import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_setup/project_setup.dart';

void main() {
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
        home: FormPage(
          formKey: GlobalKey<FormState>(),
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
                  focusNode: FormPageBloc().state.emailFocusNode,
                  hintText: "Email",
                  maxLines: 1,
                  onChanged: (value) {
                    FormPageBloc().add(EmailValidationEvent(value));
                  },
                  borderColor: Colors.grey,
                  prefixWidget: Padding(
                    padding:  EdgeInsets.only(right: 10, left: 10),
                    child: CustomSvgWidget(assetName: ImageResource.smsSvg),
                  ),
                  validator: (value) {
                    if (CommonUtilMethods.isValueEmpty(
                        value ?? "")) {
                      return emailValidationMessage;
                    } else if (!CommonUtilMethods
                        .isEmailValid(value!)) {
                      return emailValidationMessage2;
                    }
                    return null;
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
                    focusNode: FormPageBloc().state.passwordFocusNode,
                    hintText: "Password",
                    showPassword: FormPageBloc().state.isPassword,
                    isPassword: true,
                    onChanged: (value) {
                      FormPageBloc().add(PasswordValidationEvent(value));
                    },
                    borderColor: Colors.grey,
                    prefixWidget: Padding(
                      padding:  EdgeInsets.only(right: 10, left: 10),
                      child: CustomSvgWidget(assetName: ImageResource.passwordSvg),
                    ),
                    suffixWidget: Padding(
                      padding:  EdgeInsets.only(right: 15, left: 10),
                      child: CustomSvgWidget(assetName: FormPageBloc().state.isPassword == false ? ImageResource.eyeOpenSvg : ImageResource.eyeCloseSvg),
                    ),
                    suffixTap: () {
                      FormPageBloc().add(OnPasswordTap(showPassword: FormPageBloc().state.isPassword == false ? true : false));
                    },
                    validator: (value) {
                      if (CommonUtilMethods.isValueEmpty(
                          value ?? "")) {
                        return passwordValidationMessage;
                      } else if (!CommonUtilMethods
                          .isPasswordValid(value!)) {
                        return passwordLengthValidationMessage;
                      }
                      return null;
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
                onTap: () {

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
        ),
      ),
    );
  }
}
