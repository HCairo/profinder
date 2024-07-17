// Importation des modèles et du dépôt nécessaires pour le service des professionnels.
import 'package:profinder/domain/pros/pros_model.dart'; // Importation du modèle Pros.
import 'package:profinder/data/pros/pros_repository.dart'; // Importation du dépôt ProsRepository.

// Déclaration de la classe ProsService qui gère la logique métier pour les professionnels.
class ProsService {
  // Propriété finale pour stocker une instance de ProsRepository.
  final ProsRepository _prosRepository;

  // Constructeur de la classe ProsService.
  ProsService(this._prosRepository);

  // Méthode asynchrone pour obtenir la liste des professionnels.
  Future<List<Pros>> getPros() async {
    try {
      // Appel de la méthode fetchPros du dépôt pour récupérer les professionnels.
      return await _prosRepository.fetchPros();
    } catch (e) {
      // Gestion des exceptions : renvoie une liste vide en cas d'erreur.
      return [];
    }
  }
}
