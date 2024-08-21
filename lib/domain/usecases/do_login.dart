import 'package:contact_app/domain/repositories/auth_repository.dart';

class DoLogin {
  final AuthRepository authRepository;
  DoLogin(this.authRepository);

  Future<void> call(String id) async {
    return await authRepository.doLogin(id);
  }
}
