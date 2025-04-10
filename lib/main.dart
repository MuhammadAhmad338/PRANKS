import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/View/Home/View/home.dart';
import 'package:pranks/Bindings/initialBindings.dart';
import 'package:pranks/Controller/subscriptionController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver { 
  
  final SubscriptionController _subscriptionController = Get.put(SubscriptionController());
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _subscriptionController.verifySubscription();
    }
  }

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
