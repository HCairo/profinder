// Importation du fichier 'auth_response.dart' depuis le répertoire 'data/auth' du projet.
import 'package:profinder/data/auth/auth_response.dart';

// Déclaration d'une classe abstraite nommée 'AuthProvider' qui servira de modèle pour les fournisseurs d'authentification.
abstract class AuthProvider {
  // Définition d'une méthode abstraite 'login' qui prend un 'username' et un 'password' en paramètres.
  // Cette méthode retourne un Future qui résout à un objet 'AuthResponse'.
  Future<AuthResponse> login(String username, String password);
}
