import 'package:flutter/material.dart';
import 'package:profinder/common/constants.dart';
import 'package:profinder/domain/auth/auth_service.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';
import 'package:profinder/presentation/components/layout/content_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // Fonction pour vérifier si l'utilisateur est enregistré
  void rememberMe(BuildContext context) async {
    bool isRemembered = await AuthService()
        .rememberMe(); // Appel de la méthode rememberMe du service AuthService
    final routeToRedirect = isRemembered == true
        ? appRoute
        : authRoute; // Redirection basée sur la présence de l'utilisateur enregistré

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed(
        routeToRedirect); // Redirection vers la route appropriée (appRoute ou authRoute)
  }

  @override
  Widget build(BuildContext context) {
    rememberMe(
        context); // Appel de la fonction rememberMe dès que l'écran est construit

    return Scaffold(
      body: Center(
        child: ContentWrapper(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    .2), // Espace au-dessus du contenu
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              color: const Color.fromARGB(
                  255, 213, 57, 57), // Couleur de fond rouge
              child:
                  const CircularProgressIndicator(), // Indicateur de chargement circulaire
            ),
            const TitleSection('Pro Finder') // Titre de l'application
          ],
        ),
      ),
    );
  }
}
