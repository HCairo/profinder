// Déclaration de la classe Pros.
class Pros {
  // Propriété finale pour l'identifiant unique du professionnel.
  final int id;
  // Propriété finale pour le nom de famille du professionnel.
  final String lastname;
  // Propriété finale pour le prénom du professionnel.
  final String firstname;
  // Propriété finale pour la spécialité du professionnel.
  final String specialty;

  // Constructeur de la classe Pros avec des paramètres requis pour chaque propriété.
  Pros({
    required this.id, // Paramètre requis pour l'identifiant unique.
    required this.lastname, // Paramètre requis pour le nom de famille.
    required this.firstname, // Paramètre requis pour le prénom.
    required this.specialty, // Paramètre requis pour la spécialité.
  });

  // Factory pour créer une instance de Pros à partir d'un objet JSON.
  factory Pros.fromJson(Map<String, dynamic> json) {
    return Pros(
      id: json['id'], // Extraction de l'identifiant unique à partir du JSON.
      lastname:
          json['lastname'], // Extraction du nom de famille à partir du JSON.
      firstname: json['firstname'], // Extraction du prénom à partir du JSON.
      specialty:
          json['specialty'], // Extraction de la spécialité à partir du JSON.
    );
  }
}
