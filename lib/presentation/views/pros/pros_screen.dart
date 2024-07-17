import 'package:flutter/material.dart';
import 'package:profinder/data/pros/pros_repository.dart';
import 'package:profinder/presentation/components/layout/content_wrapper.dart';
import 'package:profinder/presentation/views/pros/pros_details.dart';
import 'package:profinder/domain/pros/pros_service.dart';
import 'package:profinder/domain/pros/pros_model.dart';

class ProsView extends StatefulWidget {
  final ProsRepository _prosRepository =
      ProsRepository(); // Instance du repository des professionnels

  ProsView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProsViewState createState() => _ProsViewState();
}

class _ProsViewState extends State<ProsView> {
  late Future<List<Pros>>
      _futurePros; // Future pour stocker la liste des professionnels

  @override
  void initState() {
    super.initState();
    // Appel du service pour récupérer la liste des professionnels
    _futurePros = ProsService(widget._prosRepository).getPros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pros'), // Titre de l'écran des professionnels
      ),
      body: FutureBuilder<List<Pros>>(
        future: _futurePros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Affiche un indicateur de chargement en attendant les données
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Affiche un message d'erreur s'il y a un problème avec la récupération des données
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
                    'Aucun professionnel trouvé.')); // Affiche un message si aucune donnée n'est disponible
          } else {
            return SingleChildScrollView(
              child: _buildProsList(snapshot
                  .data!), // Affiche la liste des professionnels si les données sont disponibles
            );
          }
        },
      ),
    );
  }

  Widget _buildProsList(List<Pros> prosList) {
    return ContentWrapper(
      children: [
        for (var pro in prosList) ...[
          ListTile(
            title: Text(
                '${pro.firstname} ${pro.lastname}'), // Affiche le nom complet du professionnel
            subtitle: Text(pro
                .specialty), // Affiche la spécialité du professionnel en sous-titre
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProsDetails(
                      pro:
                          pro), // Navigue vers les détails du professionnel lorsque l'utilisateur appuie sur la tuile
                ),
              );
            },
          ),
          const Divider(), // Ajoute un séparateur entre chaque professionnel
        ],
      ],
    );
  }
}
