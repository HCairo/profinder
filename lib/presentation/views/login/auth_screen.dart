import 'package:flutter/material.dart';
import 'package:profinder/common/constants.dart';
import 'package:profinder/domain/auth/auth_service.dart';
import 'package:profinder/presentation/components/atoms/button.dart';
import 'package:profinder/presentation/components/atoms/input.dart';
import 'package:profinder/presentation/components/atoms/title_section.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading =
      false; // État de chargement pour afficher l'indicateur de chargement

  _onValidate(BuildContext context) async {
    setState(() {
      _loading = true; // Déclenche l'affichage de l'indicateur de chargement
    });

    // Prépare les données d'authentification à partir des contrôleurs de texte
    AuthPayload payload = AuthPayload(
      mail: mailController.value.text,
      password: passwordController.value.text,
    );

    // Appelle le service d'authentification pour effectuer la connexion
    await AuthService().login(payload);

    // À la fin de l'authentification, arrête l'indicateur de chargement et navigue vers l'application principale
    setState(() {
      _loading = false;
      Navigator.of(context).pushNamed(appRoute);
    });
  }

  @override
  void dispose() {
    mailController.dispose(); // Libère le contrôleur de texte pour l'email
    passwordController
        .dispose(); // Libère le contrôleur de texte pour le mot de passe
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/logo.png'), // Affiche le logo de l'application
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.05), // Espace vertical fixe
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSection(
                      'Login'), // Section de titre pour le formulaire de connexion
                  const SizedBox(height: 40), // Espace vertical fixe
                  Input(
                    type: InputType.text,
                    label: "Email",
                    controller:
                        mailController, // Contrôleur de texte pour l'email
                  ),
                  const SizedBox(
                      height: 20), // Espace vertical fixe entre les champs
                  Input(
                    type: InputType.password,
                    label: "Password",
                    controller:
                        passwordController, // Contrôleur de texte pour le mot de passe
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50), // Espace vertical fixe avant le bouton
            Button(
              onPressed: () => _onValidate(
                  context), // Fonction appelée lors du tap sur le bouton
              text: "Valider", // Texte affiché sur le bouton
              isLoading:
                  _loading, // Indique si l'indicateur de chargement doit être affiché
            )
          ],
        ),
      ),
    );
  }
}

enum AuthView {
  signup,
  login
} // Énumération pour les vues d'authentification (inscription, connexion)
