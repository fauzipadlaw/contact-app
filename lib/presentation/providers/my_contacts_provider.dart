import 'package:contact_app/data/datasources/contact_local_data_source.dart';
import 'package:contact_app/data/models/contact_model.dart';
import 'package:contact_app/data/repositories/contact_repository_impl.dart';
import 'package:contact_app/domain/entities/contact.dart';
import 'package:contact_app/domain/repositories/contact_repository.dart';
import 'package:contact_app/domain/usecases/get_all_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../domain/usecases/get_groupped_contacts.dart';

final contactLocalDataSourcePrvider = Provider<ContactLocalDataSource>((ref) {
  final Box<ContactModel> contactBox = Hive.box('contacts');
  return ContactLocalDataSource(contactBox);
});

final contactRepositoryProvider = Provider<ContactRepository>((ref) {
  final localDataStorage = ref.read(contactLocalDataSourcePrvider);
  return ContactRepositoryImpl(localDataStorage);
});

final fetchContactsProvider = Provider<GetAllContacts>((ref) {
  final repository = ref.read(contactRepositoryProvider);
  return GetAllContacts(repository);
});

final contactListNotifierProvider =
    StateNotifierProvider<ContactListNotifier, List<Contact>>((ref) {
  final getContacts = ref.read(fetchContactsProvider);

  return ContactListNotifier(getContacts);
});

class ContactListNotifier extends StateNotifier<List<Contact>> {
  final GetAllContacts _getAllContacts;

  ContactListNotifier(
    this._getAllContacts,
  ) : super([]);

  Future<void> loadContacts(String query) async {
    state = await _getAllContacts(query);
  }
}

final querySearchProvider =
    StateNotifierProvider<QuerySearchNotifier, String>((ref) {
  return QuerySearchNotifier();
});

class QuerySearchNotifier extends StateNotifier<String> {
  QuerySearchNotifier() : super('');
  void onChanged(String query) => state = query;
}

// Groupped Contacts
final grouppedContactsNotifierProvider = StateNotifierProvider<
    GrouppedContactListNotifier, Map<String, List<Contact>>>((ref) {
  final getGrouppedContacts = ref.read(fetchGrouppedContactsProvider);

  return GrouppedContactListNotifier(getGrouppedContacts);
});

final fetchGrouppedContactsProvider = Provider<GetGrouppedContacts>((ref) {
  final repository = ref.read(contactRepositoryProvider);
  return GetGrouppedContacts(repository);
});

class GrouppedContactListNotifier
    extends StateNotifier<Map<String, List<Contact>>> {
  final GetGrouppedContacts _getGrouppedContacts;

  GrouppedContactListNotifier(
    this._getGrouppedContacts,
  ) : super({});

  Future<void> loadContacts() async {
    state = await _getGrouppedContacts();
  }
}
