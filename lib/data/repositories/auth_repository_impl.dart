import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

/// Mock implementation — remplacer par les appels API réels
class AuthRepositoryImpl implements AuthRepository {
  User? _currentUser;

  @override
  Future<User> login(String email, String password) async {
    // TODO: remplacer par appel API
    await Future.delayed(const Duration(seconds: 1));
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email et mot de passe requis');
    }
    _currentUser = User(
      id: 'user_1',
      name: 'Jean Dupont',
      email: email,
      phoneNumber: '+33 6 12 34 56 78',
    );
    return _currentUser!;
  }

  @override
  Future<User> register(String name, String email, String password) async {
    // TODO: remplacer par appel API
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
    );
    return _currentUser!;
  }

  @override
  Future<void> logout() async {
    // TODO: remplacer par appel API
    await Future.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
  }

  @override
  Future<User?> getCurrentUser() async {
    // TODO: remplacer par vérification du token stocké
    return _currentUser;
  }
}
