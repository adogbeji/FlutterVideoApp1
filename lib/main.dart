import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

import 'package:video_app_1/controllers/auth_controller.dart';

import 'package:video_app_1/views/screens/auth/register_screen.dart';
import 'package:video_app_1/views/screens/auth/login_screen.dart';
import 'package:video_app_1/views/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures all Flutter widgets have been successfully initialised
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  )
  .then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Video App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const RegisterScreen(),
      // home: const LoginScreen(),
      home: const HomeScreen(),
    );
  }
}