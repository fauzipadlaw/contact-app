import 'package:contact_app/data/datasources/auth_local_data_source.dart';
import 'package:contact_app/domain/repositories/auth_repository.dart';
import 'package:contact_app/domain/usecases/do_login.dart';
import 'package:contact_app/domain/usecases/do_logout.dart';
import 'package:contact_app/domain/usecases/get_logged_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../data/repositories/auth_repository_impl.dart';

final authLocalDataSourcePrvider = Provider<AuthLocalDataSource>((ref) {
  final Box<String> authBox = Hive.box('auth');
  return AuthLocalDataSource(authBox);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final localDataStorage = ref.read(authLocalDataSourcePrvider);
  return AuthRepositoryImpl(localDataStorage);
});

final fetchContactProvider = Provider<GetLoggedId>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return GetLoggedId(repository);
});

final loginProvider = Provider<DoLogin>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return DoLogin(repository);
});

final logoutProvider = Provider<DoLogout>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return DoLogout(repository);
});

final loggedIdNotifier =
    StateNotifierProvider<LoggedIdNotifier, String?>((ref) {
  final getContact = ref.read(fetchContactProvider);
  final doLogin = ref.read(loginProvider);
  final doLogout = ref.read(logoutProvider);

  return LoggedIdNotifier(getContact, doLogin, doLogout);
});

class LoggedIdNotifier extends StateNotifier<String?> {
  final GetLoggedId _getLoggedId;
  final DoLogin _doLogin;
  final DoLogout _doLogout;

  LoggedIdNotifier(
    this._getLoggedId,
    this._doLogin,
    this._doLogout,
  ) : super(null);

  Future<void> loadId() async {
    state = await _getLoggedId();
  }

  Future<void> saveId(String id) async {
    await _doLogin(id);
  }

  Future<void> logout() async {
    await _doLogout();
  }
}
