import 'package:flutter/material.dart';
import 'package:profinder/data/pros/pros_repository.dart';
import 'package:profinder/presentation/components/layout/content_wrapper.dart';
import 'package:profinder/presentation/views/pros/pros_details.dart';
import 'package:profinder/domain/pros/pros_service.dart';
import 'package:profinder/domain/pros/pros_model.dart';

class ProsView extends StatefulWidget {
  final ProsRepository _prosRepository = ProsRepository();

  ProsView({super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _ProsViewState createState() => _ProsViewState();
}

class _ProsViewState extends State<ProsView> {
  late Future<List<Pros>> _futurePros;

  @override
  void initState() {
    super.initState();
    _futurePros = ProsService(widget._prosRepository).getPros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pros'),
      ),
      body: FutureBuilder<List<Pros>>(
        future: _futurePros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No professionals found.'));
          } else {
            return SingleChildScrollView(
              child: _buildProsList(snapshot.data!),
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
            title: Text('${pro.firstname} ${pro.lastname}'),
            subtitle: Text(pro.specialty),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProsDetails(pro: pro),
                ),
              );
            },
          ),
          const Divider(),
        ],
      ],
    );
  }
}
