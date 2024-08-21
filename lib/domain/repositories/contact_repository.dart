import '../entities/contact.dart';

abstract interface class ContactRepository {
  Future<void> addContact({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? dob,
  });

  Future<List<Contact>> getAllContacts(String query);

  Future<void> deleteContact(String id);

  Future<List<Contact>> searchContacts(String query);

  Future<void> updateContact({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? dob,
  });
}
