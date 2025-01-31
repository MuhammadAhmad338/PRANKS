import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/View/Splash/View/splash.dart';
import 'package:pranks/Bindings/initialBindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PRANKS',
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Bangers",
      ),
      home: const SplashScreen(),
      initialBinding: Initialbindings(),
    );
  }
}
