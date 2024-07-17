import 'package:flutter/material.dart';
import 'package:profinder/presentation/views/pros/pros_screen.dart';
import 'package:profinder/presentation/views/settings/settings.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _navIndex = 0; // Index de navigation actuel

  final Map<int, Widget> _bodyViews = {
    0: ProsView(), // Vue pour l'index 0, affiche ProsView()
    1: SettingsScreen(), // Vue pour l'index 1, affiche SettingsScreen()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Pas de barre d'applications définie
      body:
          getBodyViewByIndex(), // Affiche le corps dynamique en fonction de _navIndex
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            navigationTap, // Fonction appelée lorsqu'un élément est tapé dans la barre de navigation inférieure
        currentIndex:
            _navIndex, // Index actuellement sélectionné dans la barre de navigation
        items: const [
          BottomNavigationBarItem(
            label: 'Pros', // Texte affiché pour l'item de navigation 'Pros'
            icon: Icon(Icons.rate_review), // Icône associée à 'Pros'
          ),
          BottomNavigationBarItem(
            label:
                'Settings', // Texte affiché pour l'item de navigation 'Settings'
            icon: Icon(Icons.settings), // Icône associée à 'Settings'
          ),
        ],
      ),
    );
  }

  // Méthode pour récupérer la vue de corps en fonction de _navIndex
  Widget getBodyViewByIndex() {
    return _bodyViews[_navIndex] ??
        Container(
          // Retourne le widget correspondant à _navIndex, sinon un conteneur rouge avec un message d'erreur
          color: Colors.red,
          child: const Center(
            child: Text('Error'), // Affiche 'Error' si _navIndex est invalide
          ),
        );
  }

  // Fonction appelée lorsqu'un élément de la barre de navigation est tapé
  void navigationTap(int value) {
    setState(() {
      _navIndex =
          value; // Met à jour _navIndex avec la nouvelle valeur sélectionnée
    });
  }
}
