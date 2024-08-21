import 'package:contact_app/domain/repositories/auth_repository.dart';

class DoLogout {
  final AuthRepository authRepository;
  DoLogout(this.authRepository);

  Future<void> call() async {
    return await authRepository.doLogout();
  }
}
