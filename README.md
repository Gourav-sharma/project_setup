# project_setup

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Project Setup

Project Setup is a Flutter plugin which provides a pre-built setup for a typical Flutter project. It includes the most common features and tools that you might need in a Flutter project.

## Features

- **Theme**: It provides a pre-built theme with a set of colors and fonts that you can use in your project.
- **String Management**: It supports provides a set of default strings that you can use in your project.
- **Navigation**: It provides a pre-built navigation system that you can use to navigate between screens.
- **Form Validation**: It provides a set of validators that you can use to validate your form fields.
- **Dialogs**: It provides a set of pre-built dialogs that you can use to alert the user.
- **Logger**: It provides a logger that you can use to log messages in your project.
- **Network**: It provides a set of network utilities that you can use to make HTTP requests. You can easily make API calls and get a response from the server.

- **BodyWidget**: It provides a pre-built body widget with a set of commonly used widgets, such as a `Scaffold`, `SingleChildScrollView`, `Padding`, and `Column`.
- **ButtonWidget**: It provides a pre-built button widget with a set of commonly used styles and properties.
- **CustomDropdown**: It provides a pre-built dropdown widget with a set of commonly used styles and properties.
- **CustomFileWidget**: It provides a pre-built file widget with a set of commonly used styles and properties.
- **CustomListWidget**: It provides a pre-built list widget with a set of commonly used styles and properties.
- **CustomSvgWidget**: It provides a pre-built SVG widget with a set of commonly used styles and properties.
- **CustomTextWidget**: It provides a pre-built text widget with a set of commonly used styles and properties.
- **CustomTextInputWidget**: It provides a pre-built text input widget with a set of commonly used styles and properties.
- **LogoutDialog**: It provides a pre-built logout dialog with a set of commonly used styles and properties.
- **PermissionDialog**: It provides a pre-built permission dialog with a set of commonly used styles and properties.
- **SideDrawer**: It provides a pre-built side drawer widget with a set of commonly used styles and properties.
- **Form Bloc**: It provides a pre-built form bloc that you can use to manage your form state. It also provides a pre-built form state and form page that you can use for all your input pages like login, signup, forgot password, etc.
To use the FormPage for a login screen in your Flutter project, follow these steps:

1. **Import the necessary packages:**

   Ensure you have the necessary imports at the top of your Dart file:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';
   import 'package:flutter/gestures.dart';
   import 'package:project_setup/form_bloc/form_bloc.dart';
   import 'package:project_setup/form_bloc/form_state.dart';
   import 'package:project_setup/form_bloc/form_page.dart';
   import 'package:project_setup/project_setup.dart';
   ```

   2. **Create the Login Page:**

      Define a `LoginFormPage` widget that uses the `FormPageBloc` to manage its form state:

    
class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FormPageBloc>(
          create: (BuildContext context) => FormPageBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc()..add(LoginInitEvent()),
        ),
      ],
      child: BlocBuilder<FormPageBloc, FormPageState>(
        builder: (context, state) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    final formBloc = BlocProvider.of<FormPageBloc>(context);

    return FormPage(
      formKey: formBloc.formKey,
      backIcon: true,
      showAppBar: true,
      backIconWidget: Icon(
        Icons.arrow_back_ios,
        color: ColorResource.primaryColor,
      ),
      padding: EdgeInsets.only(left: 20.sp, top: 20.sp, right: 20.sp),
      logoImage: AssetImageWidget(
        assetName: ImageResource.logo,
        width: 150.dp,
        height: 150.dp,
      ),
      bodyWidgets: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomTextWidget(
              text: emailHint,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor: ColorResource.lableColor,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 5),
            CustomTextFormField(
              focusNode: formBloc.state.emailFocusNode,
              hintText: "Email",
              maxLines: 1,
              onChanged: (value) {
                formBloc.add(EmailValidationEvent(value));
              },
              borderColor: Colors.grey,
              prefixWidget: Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: CustomSvgWidget(assetName: ImageResource.smsSvg),
              ),
              validator: (value) {
                if (CommonUtilMethods.isValueEmpty(value ?? "")) {
                  return emailValidationMessage;
                } else if (!CommonUtilMethods.isEmailValid(value!)) {
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
                textColor: ColorResource.lableColor,
              ),
              SizedBox(height: 5.dp),
              CustomTextFormField(
                focusNode: formBloc.state.passwordFocusNode,
                hintText: "Password",
                showPassword: formBloc.state.isPassword,
                isPassword: true,
                onChanged: (value) {
                  formBloc.add(PasswordValidationEvent(value));
                },
                borderColor: Colors.grey,
                prefixWidget: Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: CustomSvgWidget(assetName: ImageResource.passwordSvg),
                ),
                suffixWidget: Padding(
                  padding: EdgeInsets.only(right: 15, left: 10),
                  child: CustomSvgWidget(
                    assetName: formBloc.state.isPassword == false
                        ? ImageResource.eyeOpenSvg
                        : ImageResource.eyeCloseSvg,
                  ),
                ),
                suffixTap: () {
                  AppLogs.showInfoLogs(
                      "password:${formBloc.state.isPassword}");
                  formBloc.add(OnPasswordTap(
                      showPassword: formBloc.state.isPassword == false
                          ? true
                          : false));
                },
                validator: (value) {
                  if (CommonUtilMethods.isValueEmpty(value ?? "")) {
                    return passwordValidationMessage;
                  } else if (!CommonUtilMethods.isPasswordValid(value!)) {
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
              onTap: () {},
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 40),
          child: CustomButton(
            text: loginButton,
            width: 100.sw,
            elevation: 2,
            height: 50,
            onTap: () {
              formBloc.add(UnfocusEvent());
              if (formBloc.formKey.currentState!.validate()) {
                LoginBloc().add(LoginSubmittedEvent(
                    email: formBloc.state.email,
                    password: formBloc.state.password));
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
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

## How to use

To use the Project Setup plugin in your Flutter project, you can add it as a dependency in your `pubspec.yaml` file:

- **Dimensions**: It provides a set of extension methods for `num` to easily get the width and height of the screen. 
 ## You can use 
 "@override
  Widget build(BuildContext context) { 
  AppDimensions.init(context);  
  return MaterialApp();
}" 
## or you can use
@override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
       designSize: const Size(360, 690),
       minTextAdapt: true,
       splitScreenMode: true,
       child: MaterialApp.router(
          routerConfig: AppRoutes.router,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
 in your `main` method to initialize the dimensions before running the app. For example, you can use it like this:

## How to use API Calling 
### How to use API Calling

The `ApiRepository` class provides a simple way to make API calls. To use it, you need to create an instance of `ApiRepository` and then use the `apiCall` method to make the API call.

Here is an example of how to use it:
try{
  final response = await ApiRepository().apiCall(
    'endpoint',
    RequestType.get,
    queryParameters: {'param': 'value'},
    headers: {'Authorization': 'Bearer <token>'},
  );

} catch (e) {
  // error
}   
