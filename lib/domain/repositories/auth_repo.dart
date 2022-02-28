
import 'package:rapor_lc/domain/entities/user.dart';
import '../usecases/base_use_case.dart';

abstract class AuthenticationRepository extends Repository {
  /// Authenticates a user using his [email] and [password]
  Future<bool> authenticate(
      {required String email, required String password});

  /// Returns whether the [User] is authenticated.
  Future<bool> isAuthenticated();

  /// Returns the current authenticated [User].
  Future<User> getCurrentUser();

  /// Resets the password of a [User]
  Future<void> forgotPassword(String email);

  /// Logs out the [User]
  Future<void> logout();
}
