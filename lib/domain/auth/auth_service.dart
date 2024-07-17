// Importation de la classe AuthResponse depuis le package 'profinder/data/auth/auth_response.dart'.
import 'package:profinder/data/auth/auth_response.dart';
// Importation de la classe MockAuthProvider depuis le package 'profinder/data/auth/mock_auth_provider.dart'.
import 'package:profinder/data/auth/mock_auth_provider.dart';

// Déclaration de la classe AuthPayload pour encapsuler les informations d'authentification.
class AuthPayload {
  // Propriétés pour l'email et le mot de passe.
  final String mail;
  final String password;

  // Constructeur de la classe AuthPayload avec des paramètres requis pour l'email et le mot de passe.
  AuthPayload({required this.mail, required this.password});
}

// Déclaration de la classe AuthService pour gérer les services d'authentification.
class AuthService {
  // Méthode asynchrone pour se connecter en utilisant un AuthPayload.
  Future<AuthResponse> login(AuthPayload payload) async {
    // Utilise MockAuthProvider pour simuler la connexion et retourne un AuthResponse.
    return await MockAuthProvider().login(payload.mail, payload.password);
  }

  // Méthode asynchrone pour simuler la fonctionnalité "Se souvenir de moi".
  Future<bool> rememberMe() async {
    // Simule un délai de 3 secondes et retourne false.
    bool isDelayed =
        await Future.delayed(const Duration(seconds: 3), () => false);

    // Retourne le résultat du délai simulé.
    return isDelayed;
  }
}
