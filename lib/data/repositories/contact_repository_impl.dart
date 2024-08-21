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
  Future<List<Contact>> getAllContacts(String query) async {
    final blogs = await contactLocalDataSource.loadContacts(query);
    List<Contact> res = blogs.map((model) => model.toEntity()).toList();
    res.sort((a, b) => a.firstName.compareTo(b.firstName));
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
  Future<Map<String, List<Contact>>> getGrouppedContacts() async {
    List<Contact> list = await getAllContacts('');
    final Map<String, List<Contact>> groupedLists = {};
    for (var contact in list) {
      if (groupedLists[contact.firstName[0]] == null) {
        groupedLists[contact.firstName[0]] = <Contact>[];
      }

      groupedLists[contact.firstName[0]]!.add(contact);
    }
    return groupedLists;
  }

  @override
  Future<Contact?> getSingleContact(String id) async {
    var res = await contactLocalDataSource.getContact(id);
    if (res != null) return res.toEntity();
    return null;
  }
}
