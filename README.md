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

- **Dialogs**: It provides a set of pre-built dialogs that you can use to alert the user.
- **Logger**: It provides a logger that you can use to log messages in your project.
- **Network**: It provides a set of network utilities that you can use to make HTTP requests. You can easily make API calls and get a response from the server.

- **BodyWidget**: It provides a pre-built body widget with a set of commonly used widgets, such as a `Scaffold`, `SingleChildScrollView`, `Padding`, and `Column`.
- **ButtonWidget**: It provides a pre-built button widget with a set of commonly used styles and properties.
- **CustomDropdown**: It provides a pre-built dropdown widget with a set of commonly used styles and properties.
- **CustomFileWidget**: It provides a pre-built file widget to show file image in a widget.
- **CustomListWidget**: It provides a pre-built list widget with a set of commonly used styles and properties. And also loader is there in bottom when list is using pagination.
- **CustomGridWidget**: It provides a pre-built grid widget with a set of commonly used styles and properties.
- **CustomAssetWidget**: It provides a pre-built asset widget to show asset image in a widget.
- **CustomSvgWidget**: It provides a pre-built SVG widget to show SVG image in a widget.
- **CustomTextWidget**: It provides a pre-built text widget with a set of commonly used styles and properties.
- **CustomTextInputWidget**: It provides a pre-built text input widget with a set of commonly used styles and properties.
- **LogoutDialog**: It provides a pre-built logout dialog with a set of commonly used styles and properties.
- **SideDrawer**: It provides a pre-built side drawer widget with a set of commonly used styles and properties.
To use the FormPage for a login screen in your Flutter project, follow these steps:

1. **Import the necessary packages:**

   Ensure you have the necessary imports at the top of your Dart file:

   ```dart
   import 'package:project_setup/project_setup.dart';
   ```

## How to use

To use the Project Setup plugin in your Flutter project, you can add it as a dependency in your `pubspec.yaml` file:

- **Dimensions**: It provides a set of extension methods for `num` to easily get the width and height of the screen. 
  To initialize dimensions before running the app, use the following in your `main` method:

  ```dart
  @override
  Widget build(BuildContext context) { 
    AppDimensions.init(context);  
    return MaterialApp();
  }
  ```

  ```dart
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
  ```
 

## How to use API Calling

```Dart

// How to Initialize Api Repository and pass the API URL and headers as project

Future<void> main() async {
  // ✅ Initialize your plugin API and pass the API URL and headers as project
  await ApiRepository.init(
    apiUrl: "",
    appHeaders: {
      'authorization': "",
      'Content-Type': 'application/json',
      'AppVersion': '1',
      'DeviceTypeId': Platform.isIOS ? '2' : '1',
      'accessToken': "",
      'LanguageCode': 'en',
    },
  );
  runApp(const MyApp());
}

```

## User Api Calling Funtion

```Dart


var body = {
  "email": "test@example.com",
  "password": "Test@123",
  "deviceToken": "",
  "deviceType": Platform.isIOS ? 2 : 1,
  "userType": 1,
};

void callApi() async {
  try {
    final response = await ApiRepository().post(
      endpoint: 'Account/Login',
      body: body,
      fromJson: (data) => data as Map<String, dynamic>,
    );

    if (response.success && response.data != null) {
      CommonUtilMethods.showSnackBar(
        context: context,
        message: response.message ?? "Login successful",
      );
    }
  } catch (e) {
    if (context.mounted) {
      CommonUtilMethods.showSnackBar(
        context: context,
        message: e.toString(),
      );
    }
    PrintLogs.showErrorLogs(e.toString());
  }
}


```



