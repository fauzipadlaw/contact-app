import 'package:contact_app/domain/entities/contact.dart';
import 'package:contact_app/domain/repositories/contact_repository.dart';

import '../datasources/contact_local_data_source.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalDataSource contactLocalDataSource;
  ContactRepositoryImpl(this.contactLocalDataSource);

  @override
  Future<void> addContact(
      {required String id,
      required String firstName,
      required String lastName,
      String? email,
      String? dob}) {
    // TODO: implement addContact
    throw UnimplementedError();
  }

  @override
  Future<void> deleteContact(String id) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getAllContacts() async {
    final blogs = await contactLocalDataSource.loadContacts();
    List<Contact> res = blogs.map((model) => model.toEntity()).toList();
    return res;
  }

  @override
  Future<void> updateContact(
      {required String id,
      required String firstName,
      required String lastName,
      String? email,
      String? dob}) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> searchContacts(String query) {
    // TODO: implement searchContacts
    throw UnimplementedError();
  }
}
