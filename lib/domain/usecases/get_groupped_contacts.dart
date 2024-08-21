import '../entities/contact.dart';
import '../repositories/contact_repository.dart';

class GetGrouppedContacts {
  final ContactRepository contactRepository;
  GetGrouppedContacts(this.contactRepository);

  Future<Map<String, List<Contact>>> call() async {
    return await contactRepository.getGrouppedContacts();
  }
}
