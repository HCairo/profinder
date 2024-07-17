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
      title: 'Pro Finder', // Titre de l'application
      theme: ThemeData(
        // Définition du thème de l'application
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red, // Couleur principale de l'application
          backgroundColor: Colors.white, // Couleur d'arrière-plan
        ),
      ),
      routes: {
        // Définition des routes de l'application
        componentsRoute: (context) =>
            const ComponentsView(), // Route pour ComponentsView
        authRoute: (context) => const AuthScreen(), // Route pour AuthScreen
        appRoute: (context) => const AppLayout(), // Route pour AppLayout
      },
      home:
          const SplashScreen(), // Page d'accueil de l'application, SplashScreen au démarrage
    );
  }
}
