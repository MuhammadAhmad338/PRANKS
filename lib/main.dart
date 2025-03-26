import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/View/Home/View/home.dart';
import 'package:pranks/Bindings/initialBindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "PRANKS",
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Bangers",
      ),
      home: const HomeScreen(),
      initialBinding: Initialbindings(),
    );
  }
}
