import 'package:profinder/domain/pros/pros_model.dart';
import 'package:profinder/data/pros/pros_repository.dart';

class ProsService {
  final ProsRepository _prosRepository;

  ProsService(this._prosRepository);

  Future<List<Pros>> getPros() async {
    try {
      return await _prosRepository.fetchPros();
    } catch (e) {
      return [];
    }
  }
}
