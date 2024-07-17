import 'package:profinder/data/auth/auth_response.dart';
import 'package:profinder/data/auth/mock_auth_provider.dart';

class AuthPayload {
  final String mail;
  final String password;

  AuthPayload({required this.mail, required this.password});
}

class AuthService {
  Future<AuthResponse> login(AuthPayload payload) async {
    return await MockAuthProvider().login(payload.mail, payload.password);
  }

  Future<bool> rememberMe() async {
    bool isDelayed =
        await Future.delayed(const Duration(seconds: 3), () => false);

    return isDelayed;
  }
}
