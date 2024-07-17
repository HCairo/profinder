// Importation des bibliothèques nécessaires pour ce widget.
import 'package:flutter/material.dart';
import 'package:profinder/common/theme.dart'; // Importation du fichier de thème commun.
import 'package:profinder/presentation/components/atoms/custom_text.dart'; // Importation du widget CustomText.

class Button extends StatelessWidget {
  // Déclaration des propriétés du widget Button.
  final void Function()?
      onPressed; // Fonction de rappel lorsque le bouton est pressé.
  final String text; // Texte affiché sur le bouton.
  final bool isLoading; // Indicateur de chargement pour le bouton.

  // Constructeur du widget Button.
  const Button({
    super.key,
    required this.onPressed, // Paramètre requis pour la fonction de rappel.
    required this.text, // Paramètre requis pour le texte du bouton.
    this.isLoading =
        false, // Paramètre optionnel pour l'indicateur de chargement, par défaut à false.
  });

  @override
  Widget build(BuildContext context) {
    // Construction du widget.
    return GestureDetector(
      onTap:
          onPressed, // Définition de la fonction de rappel lorsque le bouton est tapé.
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.9, // Largeur du bouton basée sur la taille de l'écran.
        padding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: 30), // Marges internes du bouton.
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(radius)), // Bordures arrondies du bouton.
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Alignement du contenu au centre.
          children: [
            isLoading // Si l'indicateur de chargement est vrai, afficher un indicateur de progression.
                ? const CircularProgressIndicator()
                : Customtext(
                    // Sinon, afficher le texte du bouton.
                    text: text
                        .toUpperCase(), // Conversion du texte en majuscules.
                    type: TextType
                        .label, // Type de texte (défini dans le fichier CustomText).
                    darkBackground: true, // Indique si le fond est sombre.
                  )
          ],
        ),
      ),
    );
  }
}
