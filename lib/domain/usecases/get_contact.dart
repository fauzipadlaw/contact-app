import 'package:contact_app/domain/repositories/contact_repository.dart';

import '../entities/contact.dart';

class GetContact {
  final ContactRepository contactRepository;
  GetContact(this.contactRepository);

  Future<Contact?> call(String id) async {
    return await contactRepository.getSingleContact(id);
  }
}
