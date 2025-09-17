import 'package:flutter/material.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/app_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig :AppNavigator.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.bgApp),
      ),
    );
  }
}
