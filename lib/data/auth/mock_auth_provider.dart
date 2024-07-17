import 'package:profinder/data/auth/auth_provider.dart';
import 'package:profinder/data/auth/auth_response.dart';

class MockAuthProvider extends AuthProvider {
  @override
  Future<AuthResponse> login(String username, String password) {
    return Future.delayed(const Duration(seconds: 2),
        () => AuthResponse(statusCode: 200, userName: username));
  }
}
