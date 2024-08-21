import 'package:contact_app/domain/repositories/auth_repository.dart';

class GetLoggedId {
  final AuthRepository authRepository;
  GetLoggedId(this.authRepository);

  Future<String?> call() async {
    return await authRepository.getLoggedId();
  }
}
