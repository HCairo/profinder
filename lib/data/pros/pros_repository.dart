import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:profinder/domain/pros/pros_model.dart';

const String baseAPIUrl = 'https://qcqc.fr/profs/';

class ProsRepository {
  Future<List<Pros>> fetchPros() async {
    try {
      final response = await http.get(Uri.parse(baseAPIUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        List<Pros> pros =
            jsonResponse.map((json) => Pros.fromJson(json)).toList();
        return pros;
      } else {
        throw Exception('Failed to load professionals: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load professionals: $e');
    }
  }
}
