import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'news.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) => MaterialApp(
              title: "Coin Ticker",
              debugShowCheckedModeBanner: false,
              builder: (context, child) =>
                  AnnotatedRegion<SystemUiOverlayStyle>(
                child: child!,
                value: const SystemUiOverlayStyle(
                  systemNavigationBarColor: Colors.transparent,
                  systemNavigationBarDividerColor: Colors.transparent,
                  systemNavigationBarIconBrightness: Brightness.light,
                  systemNavigationBarContrastEnforced: false,
                  systemStatusBarContrastEnforced: false,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              theme: ThemeData.light().copyWith(
                  colorScheme:
                      const ColorScheme.light().copyWith(primary: Colors.blue),
                  scaffoldBackgroundColor: Colors.white),
              home: const NewScreen(),
            ));
  }
}
