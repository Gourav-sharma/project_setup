import 'package:project_setup/project_setup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
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
        home: const Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
