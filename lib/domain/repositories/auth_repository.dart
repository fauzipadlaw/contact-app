abstract interface class AuthRepository {
  Future<void> doLogin(String id);
  Future<void> doLogout();
  Future<String?> getLoggedId();
}
