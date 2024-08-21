import 'package:contact_app/domain/repositories/contact_repository.dart';

import '../entities/contact.dart';

class GetAllContacts {
  final ContactRepository contactRepository;
  GetAllContacts(this.contactRepository);

  Future<List<Contact>> call() async {
    return await contactRepository.getAllContacts();
  }
}
