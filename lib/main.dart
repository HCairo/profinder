import 'package:flutter/material.dart';
import 'package:profinder/common/constants.dart';
import 'package:profinder/presentation/views/components/components_view.dart';
import 'package:profinder/presentation/views/layout/app_layout.dart';
import 'package:profinder/presentation/views/login/auth_screen.dart';
import 'package:profinder/presentation/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Finder',
      theme: ThemeData(
        // Define your theme here, or import it from a common theme file
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          backgroundColor: Colors.white,
        ),
      ),
      routes: {
        componentsRoute: (context) => const ComponentsView(),
        authRoute: (context) => const AuthScreen(),
        appRoute: (context) => const AppLayout(),
      },
      home: const SplashScreen(),
    );
  }
}
