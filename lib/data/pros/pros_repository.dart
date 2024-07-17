// Importation de la bibliothèque 'dart:convert' pour la conversion JSON.
import 'dart:convert';
// Importation de la bibliothèque 'http' pour effectuer des requêtes HTTP.
import 'package:http/http.dart' as http;
// Importation du modèle 'Pros' depuis le package 'profinder/domain/pros/pros_model.dart'.
import 'package:profinder/domain/pros/pros_model.dart';

// Déclaration d'une constante pour l'URL de l'API de base.
const String baseAPIUrl = 'https://qcqc.fr/profs/';

// Déclaration de la classe 'ProsRepository' qui sera utilisée pour accéder aux données des professionnels.
class ProsRepository {
  // Méthode asynchrone pour récupérer la liste des professionnels depuis l'API.
  Future<List<Pros>> fetchPros() async {
    try {
      // Effectue une requête HTTP GET pour récupérer les données depuis l'URL de l'API.
      final response = await http.get(Uri.parse(baseAPIUrl));

      // Vérifie si la réponse a un code de statut 200 (OK).
      if (response.statusCode == 200) {
        // Décode la réponse JSON en une liste dynamique.
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        // Convertit chaque élément de la liste JSON en un objet 'Pros' et le stocke dans une liste de 'Pros'.
        List<Pros> pros =
            jsonResponse.map((json) => Pros.fromJson(json)).toList();

        // Retourne la liste des professionnels.
        return pros;
      } else {
        // Lance une exception si le code de statut n'est pas 200, avec le code de statut de la réponse.
        throw Exception('Failed to load professionals: ${response.statusCode}');
      }
    } catch (e) {
      // Lance une exception en cas d'erreur lors de la récupération ou de la conversion des données.
      throw Exception('Failed to load professionals: $e');
    }
  }
}
