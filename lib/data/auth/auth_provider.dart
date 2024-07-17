import 'package:profinder/data/auth/auth_response.dart';

abstract class AuthProvider {
  Future<AuthResponse> login(String username, String password);
}
