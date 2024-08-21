import 'package:contact_app/domain/entities/contact.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl(this.authLocalDataSource);

  @override
  Future<void> doLogin(String id) async {
    authLocalDataSource.saveLoginInfo(id);
  }

  @override
  Future<void> doLogout() {
    // TODO: implement doLogout
    throw UnimplementedError();
  }

  @override
  Future<String?> getLoggedId() async {
    return authLocalDataSource.loggedId();
  }
}
