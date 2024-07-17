// Importation de 'auth_provider.dart' depuis le package 'profinder/data/auth/'.
import 'package:profinder/data/auth/auth_provider.dart';

// Importation de 'auth_response.dart' depuis le package 'profinder/data/auth/'.
import 'package:profinder/data/auth/auth_response.dart';

// Déclaration de la classe 'MockAuthProvider' qui étend 'AuthProvider'.
class MockAuthProvider extends AuthProvider {
  // Redéfinition de la méthode 'login' de la classe parente 'AuthProvider'.
  @override
  Future<AuthResponse> login(String username, String password) {
    // Retourne un futur qui est complété après un délai de 2 secondes.
    // La réponse contient un 'AuthResponse' avec un 'statusCode' de 200 et le 'userName' fourni.
    return Future.delayed(const Duration(seconds: 2),
        () => AuthResponse(statusCode: 200, userName: username));
  }
}
