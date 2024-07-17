// Déclaration de la classe 'AuthResponse'.
class AuthResponse {
  // Déclaration d'un champ final 'statusCode' de type int.
  final int statusCode;

  // Déclaration d'un champ final 'userName' de type String? (peut être null).
  final String? userName;

  // Constructeur de la classe 'AuthResponse'.
  // Le constructeur prend deux paramètres requis : 'statusCode' et 'userName'.
  AuthResponse({required this.statusCode, required this.userName});
}
