import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:supercharged/supercharged.dart';
import 'login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Text(
        'TES AKHDAN',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: '09141A'.toColor(),
    );
  }
}
